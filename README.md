# slick-cut-mode

Minor mode for slick cutting: kill the active region, or the current line when no region is active.

## Behavior

`slick-cut` kills the active region when one is active. When no region is active, it kills the whole current line including its trailing newline — the classic "cut the line" behavior.

While `slick-cut-mode` is enabled, the `kill-region` remap is installed, so `M-w` and other kill-region callers follow the same behavior.

## Installation with [quelpa2](https://github.com/quelpa/quelpa2):

``` elisp
(quelpa2 '(slick-cut-mode :url "https://github.com/steckerhalter/slick-cut-mode"))
```

## Usage

```elisp
(slick-cut-mode 1)
```

## Functions

- `slick-cut` — Kill the active region, or the whole current line if no region is active.
- `slick-cut-mode` — Minor mode; toggles the `kill-region` remap.

## License

GPL-3.0-or-later.
