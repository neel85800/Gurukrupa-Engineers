# Gurukrupa Engineers — website

A 3D website for Gurukrupa Engineers (Bhavesh Patel), manufacturer of chain
wheels and sprockets. Eight pages, one for each part of the site.

Every sprocket on this site is **generated in 3D in the browser** from real
chain geometry — no photographs, no downloaded models. That means the parts
are always sharp, the whole site is under 3 MB, and a new product is a dozen
lines of configuration rather than a photo shoot.

---

## Seeing it on your computer

Double-click **`start.bat`**. It opens the site at <http://localhost:8000>.
Close the black window (or press `Ctrl+C` in it) to stop it.

> A browser will not run this site by opening `index.html` directly — modern
> browsers block JavaScript modules loaded from a bare file path. `start.bat`
> works around that by serving the folder properly. Once it is on real web
> hosting this is not an issue.

Needs Python, which is already installed on this machine.

---

## The pages

| File | What's on it |
|---|---|
| `index.html` | Home — the chain-drive hero, plus a set of cards linking to every other page |
| `products.html` | Ten sprocket types, each a 3D model you can drag to rotate |
| `capabilities.html` | Six cards covering the shop processes |
| `chain-range.html` | The ISO/BS standard chain reference table |
| `process.html` | Six steps from enquiry to dispatch |
| `industries.html` | Sectors supplied |
| `about.html` | About the shop and Bhavesh Patel |
| `contact.html` | Phone, WhatsApp, email and the enquiry form |

The header menu links to six of these (Home is reached via the logo).
**Industries** doesn't have its own header link — by design, to keep the menu
short — but it's reachable from the Home page cards and from every page's
footer. Every page except Contact ends with a WhatsApp/Contact call-to-action
above the footer, since a visitor can land on any one of them directly from a
search engine.

---

## Putting it online

The whole folder is a plain static website. Upload it as-is to any host —
there is no build step, no server code, no database.

- **Netlify / Cloudflare Pages / Vercel** — drag the folder onto their
  dashboard. Free, and gives HTTPS automatically.
- **Normal cPanel / shared hosting** — upload the folder contents into
  `public_html`.
- **GitHub Pages** — push the folder to a repository and enable Pages.

Do not upload `serve.py`, `start.bat` or `README.md` — they are only for
working on the site locally. Everything else is needed.

---

## Things you should check or fill in

I have written the content from what a sprocket shop normally does. **Please
read these and correct anything that is not true of your workshop** — they are
marked with `EDIT ME` comments in the files.

| Where | What to check |
|---|---|
| `index.html` — hero | "Chain series 06B – 32B" and "Rows 1 / 2 / 3". Change to your actual range. |
| `capabilities.html` | Six cards: tooth cutting, turning & boring, heat treatment, fabricated wheels, inspection, repair. Delete any you do not do in house. |
| `industries.html` | Twelve sectors listed. Trim to the ones you actually supply. |
| `contact.html` | **Workshop address** and **working hours** are placeholders reading "to be added". Send them to me and I will put them in. |
| `js/data/products.js` | Ten product types with example tooth counts, bores and materials. Remove any product line you do not make. |

The **Standard chain range** table (06B–32B pitches, roller diameters, ANSI
equivalents) is taken from the ISO 606 / BS 228 standard, so those numbers are
correct as published — but confirm the "Rows available" column matches what you
can cut.

Two things I deliberately did **not** invent, because a wrong answer would be
worse than none: years in business, and number of staff or machines. If you
want those on the site, tell me the real figures.

### About the pictures you sent

- `images/images.jpg` — the sprocket render. Used as the social-sharing preview
  image on every page. Worth replacing with a photo of your own work when you
  have one.
- `images/prod-20220607-…webp` — the chart of sprocket types. **Not used on the
  site.** It is a stock image with another company's watermark on it
  (`engineeringchoice.com`), so publishing it would be someone else's
  copyright. I used the product *names* from it to build the catalogue, and
  modelled all ten shapes in 3D instead.

---

## What is on the site

1. **Hero (Home)** — a working two-sprocket chain drive. The chain travels a
   set distance per second and both sprockets take their rotation from that
   travel, so the teeth stay properly engaged with the rollers indefinitely.
   Move the mouse for a slight parallax.
2. **Products** — ten sprocket types, each a live 3D model you can drag to
   rotate, with specs and applications.
3. **Capabilities** — six cards covering the shop processes.
4. **Standard chain range** — the ISO/BS reference table.
5. **Process** — six steps from enquiry to dispatch.
6. **Industries**, **About**, **Contact**.

The enquiry form has no server behind it. It composes the message and hands it
to WhatsApp or the visitor's own email app — so nothing can break, nothing
needs maintaining, and no data is stored anywhere.

Phone, WhatsApp and email links appear in the header, hero, about card, contact
page and footer, plus a fixed Call / WhatsApp bar on phones.

Only Home and Products load the 3D engine — the other six pages carry none of
that weight, so they open instantly.

---

## Adding another product

Open `js/data/products.js` and copy an existing block:

```js
{
  id: 'my-sprocket',                  // must be unique, no spaces
  name: 'My Sprocket',
  tagline: 'Short line under the name',
  description: 'A sentence or two about it.',
  specs: [
    ['Chain', '10B-1 (ISO)'],
    ['Pitch', '15.875 mm'],
    ['Teeth', '19']
  ],
  applications: ['Conveyors', 'Pumps'],
  build: {
    pitch: 0.62,      // model scale, not millimetres — keep between 0.4 and 1.0
    teeth: 19,
    strands: 1,       // 1, 2 or 3 rows of teeth
    thickness: 0.34,
    bore: 0.72,
    hub: 'one'        // 'one', 'both' or 'none'
  }
}
```

This is the only file you need to touch — it drives `products.html`
automatically. The 3D model builds itself from `build`. Other options you can
add there: `lightening` (holes in the web), `taperBush`, `bearing`, `split`,
`keyWidth`, `hubDiaScale`, `hubLengthScale`. See `js/lib/sprocket.js` for what
each does.

Specs are shown in a 3×2 grid, so **six spec rows looks best**.

---

## Editing the other pages

Each page is a normal, self-contained HTML file — open it in any text editor
and change the words directly, the same as editing a Word document's text.
The header, footer, and the WhatsApp/Contact strip near the bottom look
identical on every page on purpose; if you ever need to change one (e.g. a new
phone number), the fastest way is to ask me to change it everywhere at once,
since it means editing the same block in all eight files consistently.

---

## How the folder is arranged

```
index.html              Home
products.html           Products
capabilities.html       Capabilities
chain-range.html        Standard chain range
process.html            Process
industries.html         Industries
about.html              About
contact.html            Contact
css/style.css           all styling, shared by every page
assets/                 logo, favicon, fallback artwork (all generated)
images/                 your photographs
js/
  common.js             header menu, scroll-reveal, footer year — shared by every page
  data/products.js      the product catalogue  ← edit this to change products
  lib/sprocket.js       generates sprocket geometry from chain dimensions
  lib/chain.js          generates the roller chain and its path
  lib/materials.js      steel materials and the lighting environment
  lib/stage.js          shared renderer, resizing, pausing, cleanup
  scenes/hero.js        the chain drive on the Home page
  scenes/viewer.js      the product turntable on the Products page
  pages/home.js         Home page's own script
  pages/products.js     Products page's own script
  pages/contact.js      Contact page's own script (the enquiry form)
  pages/simple.js       shared script for the five pages with no 3D or form
  vendor/               Three.js (kept local so the site works offline)
serve.py, start.bat     local preview only — do not upload
```

---

## Notes on how it behaves

- **Nothing runs when it cannot be seen.** Each 3D scene stops rendering when
  it scrolls off screen or the tab is hidden, so it does not drain phone
  batteries.
- **It gets out of the way on slow devices.** Resolution drops automatically if
  frames start taking too long.
- **Reduced motion is respected.** Visitors who have asked their device to
  minimise animation get a still, composed frame instead of movement.
- **It degrades rather than breaks.** If a browser cannot do 3D at all, the
  canvases are replaced with a line drawing and every word on the page still
  reads normally.
- **The text is real text**, not baked into the 3D, so Google can index it and
  screen readers can read it.
- **Only two pages carry the 3D engine.** Capabilities, Chain range, Process,
  Industries, About and Contact never load Three.js at all.

Measured budgets: hero 20 draw calls / ~91k triangles, product viewer 6–14
draw calls / 7–15k triangles. Both comfortably inside a mid-range phone's
capability.
