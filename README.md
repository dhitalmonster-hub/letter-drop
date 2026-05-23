# Letter Drop

Claim sequential letters from a cycling a..z drop. Every call hands out the next letter and rolls forward.

## Contract

- **Address:** `SP20Z3WPE6PVN1B8APDQNDH5BR1AJNMR25QPCSGFT.letter-drop`
- **Network:** Stacks Mainnet
- **Clarity Version:** 4

## Functions

- `(claim)` — receive the next letter (1=a .. 26=z). Letter is appended to your personal list (cap 200).
- `(get-letters user)` — read-only, the user's collected list of letter ids.
- `(peek-next)` — read-only, which letter the next caller will get.
- `(total)` — read-only, total drops since deploy.

## Frontend

Static HTML in `frontend/`. Connect, hit Claim.

## License

MIT

---

_Last updated: 2026-05-23_
