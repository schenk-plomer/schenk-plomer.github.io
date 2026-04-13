# Schenk & Plomer – Website

Webseite der Schenk & Plomer GmbH und Plomer & Dachs GmbH.  
Live unter: **https://schenk-plomer.github.io** (via GitHub Pages)

---

## 📁 Ordnerstruktur

```
.
├── index.html                  ← Startseite
├── modern.css                  ← Zentrales Stylesheet (ALLE Farben, Fonts, Layouts)
├── favicon.png                 ← Browser-Tab Icon
├── CNAME                       ← Custom Domain (schenk-plomer.de)
│
├── unternehmen/index.html      ← Firmenprofil, Werte, Team
├── karriere/index.html         ← Jobs & 60s-Bewerbungsformular
├── referenzen/index.html       ← Filterbare Projektgalerie
├── kontakt/index.html          ← Kontaktdaten & Karte
├── service/index.html          ← Service & Wartung
├── presse/index.html           ← News & Presseartikel
├── historie/index.html         ← Timeline seit 1993
│
├── luft-und-klimatechnik/      ← Fachseite Schenk & Plomer
├── technische-gebäudeausstattung/ ← Fachseite Plomer & Dachs
├── privat-klimatisieren/       ← Kampagnenseite Privatklima
│
├── impressum/index.html        ← Rechtlich
├── datenschutz/index.html      ← Rechtlich
├── haftungsausschluss/index.html ← Rechtlich
├── agb/index.html              ← Rechtlich
│
└── uploads/                    ← Alle Bilder & Medien
    ├── slider/                 ← Hero-Slider Bilder (Startseite)
    ├── logos/                  ← Firmenlogos (S&P, P&D)
    ├── icons/                  ← Fachbereich-Icons
    ├── referenzen/             ← Projektfotos (CleverFit, LRA, etc.)
    ├── team/                   ← Team- und Firmenfotos
    ├── sponsoring/             ← EVL, SPVGG Logos
    ├── presse/                 ← Pressebilder
    └── ausbildung/             ← Ausbildungs-Zertifikate
```

---

## 🎨 Inhalte anpassen

### Farben & Schriften ändern
Öffne `modern.css` und bearbeite die Variablen ganz oben:
```css
:root {
  --brand-blue: #312783;     /* ← Hauptfarbe hier ändern */
  --bg-primary: #FFFFFF;     /* ← Hintergrund */
  --font-heading: 'Arial Black', Arial, sans-serif;
}
```

### Neue Stellenanzeige hinzufügen
In `karriere/index.html` einfach einen neuen `<details>` Block kopieren:
```html
<details class="job-accordion">
  <summary>Neue Stelle (m/w/d)</summary>
  <div class="content">
    <p>Beschreibung der Stelle...</p>
  </div>
</details>
```

### Neues Referenz-Projekt hinzufügen
In `referenzen/index.html` einen neuen `.ref-card` Block einfügen:
```html
<div class="ref-card" data-category="lueftung gewerbe">
  <img class="ref-bg" src="/uploads/referenzen/BILDNAME.jpg" alt="Projektname">
  <div class="ref-overlay"></div>
  <div class="ref-body">
    <h3>Projektname</h3>
    <p>Kurzbeschreibung</p>
    <div class="ref-specs">
      <span class="spec-badge">Kategorie</span>
      <span class="spec-badge">Technisches Detail</span>
    </div>
  </div>
</div>
```

### Hero-Slider Bilder tauschen
Die drei Slider-Bilder liegen in `uploads/slider/`. Einfach die JPGs ersetzen (gleicher Dateiname behalten).

---

## 🚀 Änderungen live stellen

```bash
git add -A
git commit -m "Beschreibung der Änderung"
git push origin master
```
→ Seite aktualisiert sich automatisch nach ~1 Minute.
