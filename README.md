# Schenk & Plomer GmbH – Website-Dokumentation

Diese Dokumentation richtet sich an **nicht-technische Redakteure**, die Inhalte der Website pflegen oder anpassen möchten. Alle Änderungen werden direkt über GitHub vorgenommen.

---

## Inhaltsverzeichnis

1. [Wie funktioniert die Website?](#wie-funktioniert-die-website)
2. [Projektstruktur im Überblick](#projektstruktur-im-überblick)
3. [Inhalte ändern – Schritt für Schritt](#inhalte-ändern--schritt-für-schritt)
4. [Markdown-Grundregeln](#markdown-grundregeln)
5. [Bilder hochladen und einbinden](#bilder-hochladen-und-einbinden)
6. [Navigation anpassen](#navigation-anpassen)
7. [Design und Vorlage ändern](#design-und-vorlage-ändern)
8. [Änderungen veröffentlichen](#änderungen-veröffentlichen)

---

## Wie funktioniert die Website?

Die Website wird mit **Hugo** erstellt – einem System, das aus einfachen Textdateien (Markdown) fertige HTML-Seiten baut.

Der wichtige Ablauf:

1. Inhalte werden als Textdateien im **Branch `source`** gespeichert.
2. Jeder Commit (= Speichern einer Änderung) auf dem Branch `source` löst automatisch einen **Neuaufbau der Website** aus.
3. Die fertige Website wird im Branch `master` veröffentlicht und ist unter [schenk-plomer.de](https://schenk-plomer.de) erreichbar.

> **Wichtig:** Änderungen immer im Branch `source` vornehmen. Direkte Änderungen im Branch `master` werden beim nächsten Build überschrieben.

---

## Projektstruktur im Überblick

```
schenk-plomer.github.io/
│
├── content/                  ← Seiteninhalte (HIER arbeiten Sie hauptsächlich)
│   ├── _index.md             ← Startseite
│   ├── unternehmen.md        ← Seite "Unternehmen"
│   ├── referenzen.md         ← Seite "Referenzen"
│   ├── kontakt.md            ← Seite "Kontakt"
│   ├── service.md            ← Seite "Service"
│   ├── karriere.md           ← Seite "Karriere"
│   ├── presse.md             ← Seite "Presse"
│   ├── historie.md           ← Seite "Historie"
│   ├── luft-und-klimatechnik.md
│   ├── technische-gebäudeausstattung.md
│   ├── impressum.md
│   ├── datenschutz.md
│   ├── agb.md
│   ├── haftungsausschluss.md
│   └── global/
│       ├── header.md         ← Globaler Seitenkopf
│       └── footer.md         ← Globale Fußzeile
│
├── static/
│   └── uploads/              ← Hochgeladene Bilder und Dokumente
│       ├── 2024/
│       │   └── MM/DD/        ← Datum-Ordnerstruktur
│       └── ...
│
└── themes/schenk-plomer/
    ├── layouts/              ← HTML-Vorlagen (technisch)
    └── static/
        ├── styles.css        ← Haupt-Stylesheet (Design)
        └── styles.less       ← Design-Quellcode
```

---

## Inhalte ändern – Schritt für Schritt

### Auf GitHub navigieren

1. Öffnen Sie das Repository auf GitHub.
2. Stellen Sie sicher, dass Sie sich im Branch **`source`** befinden (Dropdown oben links, dort steht der aktuelle Branch-Name).
3. Klicken Sie auf den Ordner `content/`.
4. Öffnen Sie die gewünschte Seite, z. B. `unternehmen.md`.
5. Klicken Sie auf das **Stift-Symbol** (✏️ „Edit this file"), um die Datei zu bearbeiten.
6. Nehmen Sie Ihre Änderungen vor.
7. Klicken Sie unten auf **„Commit changes"**, geben Sie eine kurze Beschreibung ein und bestätigen Sie.

Die Website wird automatisch neu gebaut und innerhalb weniger Minuten veröffentlicht.

---

### Aufbau einer Inhalts-Datei

Jede Seite besteht aus zwei Teilen, getrennt durch `+++`:

```
+++
title = "Unternehmen"
seo_description = "Beschreibung für Suchmaschinen"
titel_bild = "/uploads/2024/01/15/header-bild.jpg"

[menu.main]
name = "Unternehmen"
weight = 3
+++

Hier steht der eigentliche Seiteninhalt als Text oder HTML.
```

**Erklärung der häufigsten Felder:**

| Feld | Bedeutung |
|------|-----------|
| `title` | Seitentitel (wird im Browser-Tab angezeigt) |
| `seo_description` | Kurzbeschreibung für Google & Co. |
| `titel_bild` | Pfad zum Header-Bild der Seite |
| `bilder` | Liste von Bildpfaden für Galerien |
| `layout` | Welche HTML-Vorlage verwendet wird (nicht ändern) |
| `[menu.main]` | Eintrag in der Navigation (siehe Abschnitt Navigation) |
| `[menu.main] name` | Bezeichnung im Navigationsmenü |
| `[menu.main] weight` | Reihenfolge im Menü (kleinere Zahl = weiter links) |

> **Hinweis:** Der Bereich zwischen den `+++` verwendet das **TOML-Format**. Texte stehen immer in Anführungszeichen `"..."`. Zahlen ohne Anführungszeichen.

---

## Markdown-Grundregeln

Der Textbereich **unterhalb** der `+++`-Trennlinie kann normalen Text, HTML und einfaches Markdown enthalten.

### Absätze und Zeilenumbrüche

- **Neuer Absatz:** Eine leere Zeile zwischen zwei Textblöcken einfügen.
- **Einfacher Zeilenumbruch** innerhalb eines Absatzes: Zeile mit zwei Leerzeichen enden lassen, oder `<br>` verwenden.

```
Das ist der erste Satz.
Das steht in der gleichen Zeile (kein Umbruch!).

Das ist ein neuer Absatz (eine Leerzeile dazwischen).

Erste Zeile.<br>
Zweite Zeile (mit HTML-Umbruch).
```

### HTML in Inhalten

Da die Inhalte oft komplexere Formatierungen benötigen, wird **HTML direkt im Text** verwendet. Das ist erlaubt und erwünscht.

Häufige HTML-Tags:

```html
<strong>Fettgedruckter Text</strong>
<em>Kursiver Text</em>
<br>                          (Zeilenumbruch)
<p>Ein Absatz</p>
<a href="https://...">Linktext</a>
```

**Achtung bei Sonderzeichen in HTML-Attributen:** Das kaufmännische `&` muss als `&amp;` geschrieben werden, wenn es in HTML-Attributen oder -Texten vorkommt:

```html
<!-- Falsch: -->
Schenk & Plomer

<!-- Richtig in HTML-Kontext: -->
Schenk &amp; Plomer
```

### Bilder im Textbereich

Bilder werden im Text über den Bildpfad eingebunden:

```html
<img src="/uploads/2024/01/15/mein-bild.jpg" alt="Bildbeschreibung">
```

> In den meisten Seiten werden Bilder jedoch über das Frontmatter (zwischen `+++`) eingebunden, nicht direkt im Text.

---

## Bilder hochladen und einbinden

### Schritt 1: Bild hochladen

1. Navigieren Sie auf GitHub in den Ordner `static/uploads/`.
2. Erstellen Sie bei Bedarf einen Unterordner nach dem Schema `JJJJ/MM/TT/` (Jahr/Monat/Tag), z. B. `2024/03/20/`.
   - Klicken Sie auf „Add file" → „Create new file"
   - Tippen Sie den Ordnerpfad ein, z. B. `static/uploads/2024/03/20/.gitkeep`, und speichern Sie (legt den Ordner an)
3. Navigieren Sie in den neu erstellten Ordner.
4. Klicken Sie auf **„Add file" → „Upload files"**.
5. Laden Sie Ihr Bild hoch (JPG, PNG oder PDF).
6. Bestätigen Sie mit „Commit changes".

### Schritt 2: Bild referenzieren

Der Pfad des hochgeladenen Bildes ergibt sich aus dem Speicherort innerhalb von `static/`:

| Speicherort auf GitHub | Pfad im Inhalt |
|------------------------|----------------|
| `static/uploads/2024/03/20/mein-bild.jpg` | `/uploads/2024/03/20/mein-bild.jpg` |

**Beispiel im Frontmatter (Header-Bild einer Seite):**

```toml
titel_bild = "/uploads/2024/03/20/mein-bild.jpg"
```

**Beispiel als Bilderliste (Galerie):**

```toml
bilder = [
  "/uploads/2024/03/20/bild1.jpg",
  "/uploads/2024/03/20/bild2.jpg",
  "/uploads/2024/03/20/bild3.jpg"
]
```

**Beispiel direkt im HTML-Text:**

```html
<img src="/uploads/2024/03/20/mein-bild.jpg" alt="Beschreibung des Bildes">
```

### Empfehlungen für Bilder

- Dateinamen **ohne Leerzeichen und Umlaute** verwenden (statt `Büro Foto.jpg` besser `buero-foto.jpg`)
- Bildgröße vor dem Hochladen optimieren (max. 1–2 MB für Fotos empfohlen)
- Format: JPG für Fotos, PNG für Grafiken mit transparentem Hintergrund

---

## Navigation anpassen

Die Navigationseinträge werden direkt in den jeweiligen Seitendateien gesteuert.

**Eintrag hinzufügen** – folgenden Block ins Frontmatter der Seite einfügen:

```toml
[menu.main]
name = "Mein Menüpunkt"
weight = 6
```

**Eintrag entfernen** – den `[menu.main]`-Block aus der Frontmatter der Seite löschen.

**Reihenfolge ändern** – den `weight`-Wert anpassen. Kleinere Zahlen erscheinen weiter links:

| weight | Position |
|--------|----------|
| 1 | ganz links |
| 2 | zweite Position |
| ... | ... |

---

## Design und Vorlage ändern

> **Hinweis:** Änderungen an Design und Vorlagen erfordern technisches Wissen und sollten nur von erfahrenen Nutzern vorgenommen werden.

### Stylesheet (CSS)

Das Haupt-Stylesheet befindet sich unter:

```
themes/schenk-plomer/static/styles.css
```

Farben, Schriftgrößen, Abstände und Layout werden hier festgelegt. Die eigentliche Quelldatei ist `styles.less` – Änderungen sollten dort vorgenommen und dann als `styles.css` exportiert werden.

### HTML-Vorlagen

Die HTML-Vorlagen (Templates) liegen unter:

```
themes/schenk-plomer/layouts/
├── _default/
│   ├── baseof.html          ← Basis-Layout (Kopf, Fuß, Scripts)
│   ├── unternehmen.html     ← Vorlage für "Unternehmen"
│   ├── referenzen.html      ← Vorlage für "Referenzen"
│   ├── kontakt.html         ← Vorlage für "Kontakt"
│   └── ...
└── partials/
    ├── header.html          ← Navigationsleiste
    ├── footer.html          ← Fußzeile
    └── ...                  ← Weitere Bausteine
```

Jede Seite in `content/` verweist über das Feld `layout = "..."` auf ihre zugehörige Vorlage.

---

## Änderungen veröffentlichen

1. Alle Änderungen müssen im **Branch `source`** erfolgen.
2. Nach jedem **Commit** (Speichern auf GitHub) startet automatisch ein Build-Prozess.
3. Nach ca. **1–3 Minuten** ist die aktualisierte Website unter [schenk-plomer.de](https://schenk-plomer.de) sichtbar.

### So überprüfen Sie den Build-Status

1. Öffnen Sie das Repository auf GitHub.
2. Klicken Sie auf den Reiter **„Actions"**.
3. Der neueste Eintrag zeigt den Status:
   - ✅ Grüner Haken = Build erfolgreich, Website aktualisiert
   - ❌ Rotes X = Fehler beim Build (Änderung enthält einen Syntaxfehler)

### Bei einem Build-Fehler

Überprüfen Sie die zuletzt geänderte Datei auf:
- Fehlende oder falsch gesetzte Anführungszeichen `"` im Frontmatter
- Nicht geschlossene HTML-Tags
- Sonderzeichen, die nicht korrekt kodiert wurden

---

*Bei Fragen oder Problemen wenden Sie sich an den technischen Betreuer der Website.*
