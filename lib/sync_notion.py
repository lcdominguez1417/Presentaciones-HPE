#!/usr/bin/env python3
"""Sync presentations/ folder to Notion database on every push."""

import os
import re
import sys
import requests
from pathlib import Path

NOTION_TOKEN = os.environ["NOTION_TOKEN"]
DATABASE_ID = "49d3cb1c9ef04fc6a0a9bf0dd70b64b3"
BASE_URL = "https://lcdominguez1417.github.io/Presentaciones-HPE"
PRESENTATIONS_DIR = Path("presentations")

HEADERS = {
    "Authorization": f"Bearer {NOTION_TOKEN}",
    "Content-Type": "application/json",
    "Notion-Version": "2022-06-28",
}


def get_existing_links() -> dict[str, str]:
    """Return {link_url: notion_page_id} for all rows in the database."""
    url = f"https://api.notion.com/v1/databases/{DATABASE_ID}/query"
    existing = {}
    cursor = None
    while True:
        body = {"page_size": 100}
        if cursor:
            body["start_cursor"] = cursor
        r = requests.post(url, headers=HEADERS, json=body)
        r.raise_for_status()
        data = r.json()
        for page in data["results"]:
            link = page["properties"].get("Link", {}).get("url") or ""
            if link:
                existing[link] = page["id"]
        if not data.get("has_more"):
            break
        cursor = data["next_cursor"]
    return existing


def parse_content_md(folder: Path) -> dict:
    """Extract topic, tema, and created from content.md front-matter."""
    content_md = folder / "content.md"
    result = {"topic": None, "tema": None, "created": None}
    if not content_md.exists():
        return result
    for line in content_md.read_text(encoding="utf-8").splitlines():
        if line.startswith("topic:"):
            result["topic"] = line.split(":", 1)[1].strip()
        elif line.startswith("tema:"):
            result["tema"] = line.split(":", 1)[1].strip()
        elif line.startswith("created:"):
            result["created"] = line.split(":", 1)[1].strip()
    return result


def guess_tema(title: str) -> str:
    t = title.lower()
    if "catolicismo" in t or "evangélica" in t or "evangelica" in t:
        return "Apologética — Fe Evangélica"
    if "origen" in t:
        return "Apologética — Origen de la Vida"
    if "moral" in t:
        return "Apologética — Argumento Moral"
    return "Apologética"


def clean_title(folder_name: str) -> str:
    name = re.sub(r"-(the-verge-scroll|stripe-scroll|scroll)$", "", folder_name)
    return name.replace("-", " ").title()


def add_entry(title: str, link: str, tema: str) -> None:
    r = requests.post(
        "https://api.notion.com/v1/pages",
        headers=HEADERS,
        json={
            "parent": {"database_id": DATABASE_ID},
            "properties": {
                "Título": {"title": [{"text": {"content": title}}]},
                "Link": {"url": link},
                "Tema": {"rich_text": [{"text": {"content": tema}}]},
            },
        },
    )
    r.raise_for_status()
    print(f"✅ Agregada: {title}")


def main() -> None:
    existing = get_existing_links()
    added = 0

    for folder in sorted(PRESENTATIONS_DIR.iterdir()):
        if not folder.is_dir() or not (folder / "slides.html").exists():
            continue

        link = f"{BASE_URL}/presentations/{folder.name}/slides.html"

        if link in existing:
            print(f"⏭️  Ya existe: {folder.name}")
            continue

        meta = parse_content_md(folder)
        title = meta["topic"] or clean_title(folder.name)
        tema = meta["tema"] or guess_tema(title)
        add_entry(title, link, tema)
        added += 1

    print(f"\n{added} presentación(es) nueva(s) agregada(s) a Notion.")


if __name__ == "__main__":
    main()
