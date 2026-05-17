# ~/Code

Single root for all source code on this machine. Top-level slots are
intent-shaped — what something *is*, not how recently you've touched
it or how it gets used.

## Structure

| Slot          | What lives here                                                    |
|---------------|--------------------------------------------------------------------|
| `work/`       | Active development — anything I'm currently editing                |
| `forks/`      | Repos where I PR back to someone else's upstream                   |
| `tools/`      | CLIs I run from a shell                                            |
| `reference/`  | Read-only material — I look here, I don't edit                     |
| `config/`     | Dotfiles and per-app/per-project configuration                     |
| `worktrees/`  | Git worktrees for active feature branches (managed by `gtr`)       |
| `snapshots/`  | Pre-change backups written by the `/snapshot` skill                |

The first five are user-editorial (organised by me). The last two are
tool-managed — created and destroyed by their managing tool, with the
internal structure described below.

## Layout at a glance

```text
~/Code/
├── work/
│   ├── <client>/
│   │   ├── apps/<app>/
│   │   └── packages/<package>/
│   └── personal/
│       ├── apps/<app>/
│       ├── libraries/<library>/
│       └── scratch/<spike>/
│
├── forks/
│   └── <upstream-owner>/<repo>/
│
├── tools/
│   ├── custom/<tool>/      # I author and publish
│   └── vendor/<tool>/      # third-party I install
│
├── reference/
│   └── <ecosystem>/        # laravel, filament, wordpress, ...
│       ├── apps/<app>/
│       └── packages/<package>/
│
├── config/
│   ├── global/<app>/       # dotfiles, claude, opencode, warp
│   └── projects/<project>/ # per-project overlays
│
├── worktrees/
│   └── <client>/<repo>/<branch>/   # path shape set per-repo via gtr.worktrees.dir
│
└── snapshots/
    └── <project-path>/<branch>-<timestamp>/   # mirrors source location under ~/Code/
```

## Two splits that matter

### `apps/` vs `packages/`

Inside both `work/<client>/` and `reference/<ecosystem>/`, runnable
applications go in `apps/`, everything else (libraries, asset
bundles, scripts) goes in `packages/`.

```text
work/brand-iq/apps/admin/        ← Laravel app (Herd-served)
work/brand-iq/packages/icons/    ← supporting library
```

### `tools/custom/` vs `tools/vendor/`

Things I author go in `custom/`, third-party things I install go in
`vendor/`.

## Where common things go

| What it is                              | Where it goes                              |
|-----------------------------------------|--------------------------------------------|
| Client project — runnable app           | `work/<client>/apps/<app>/`                |
| Client project — supporting package     | `work/<client>/packages/<package>/`        |
| Personal app or site                    | `work/personal/apps/<app>/`                |
| Personal OSS library (non-CLI)          | `work/personal/libraries/<library>/`       |
| Personal CLI I author and publish       | `tools/custom/<tool>/`                     |
| Third-party CLI I install               | `tools/vendor/<tool>/`                     |
| Fork I contribute upstream to           | `forks/<upstream-owner>/<repo>/`           |
| Package source clone for reading        | `reference/<ecosystem>/packages/<package>/`|
| Reference app (Laravel, Filament, etc.) | `reference/<ecosystem>/apps/<app>/`        |
| Throwaway experiment / spike            | `work/personal/scratch/<spike>/`           |

## What does NOT live here

- Documents, design files, raw assets — out of scope; use Drive / Dropbox / Figma.
- Archived projects — don't archive in place; move to external storage.

## Conventions

- The `dot` prefix is dropped from config repo names (e.g. `dotclaude` →
  `config/global/claude/`). The folder describes intent, not the symlink target.
- Empty slots aren't pre-created. The rule for "where does X go" is documented
  even when no X exists yet — the folder appears when there's something to put in it.
- Whether a project is "active" is queryable via `git log`. It doesn't live
  in the path; there's no `archive/`.
