# ── Prompt ───────────────────────────────────────────────────────────────────

# A clean two-segment prompt: cwd + git branch
def create_left_prompt [] {
    let dir = ($env.PWD | str replace $env.HOME "~")

    let git_branch = (
        do { git rev-parse --abbrev-ref HEAD }
        | complete
        | if $in.exit_code == 0 { $"($in.stdout | str trim)" } else { "" }
    )

    let git_string = ( if $git_branch != "" {
            $"(ansi blue) git:\((ansi red)($git_branch)(ansi blue)\)"
        } else { "" }
    )

    $"(ansi cyan_bold)($dir)(ansi reset)($git_string)(ansi reset) "
}

# Right prompt has a nix shell indicator and the time
def create_right_prompt [] {

    let time = (date now | format date "%H:%M:%S")
    let nix_shell = ($env.IN_NIX_SHELL? | default "")
    let nix_color = if $nix_shell == "pure" { "green_bold" } else { "yellow_bold" }
    let nix_icon = ($"(ansi $nix_color)✱(ansi reset) ")

    $"($nix_icon)(ansi dark_gray)($time)(ansi reset)"
}

$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
$env.PROMPT_INDICATOR = $"(ansi cyan_bold)❯ (ansi reset)"
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi green_bold)❯ (ansi reset)"
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi yellow_bold)● (ansi reset)"
$env.PROMPT_MULTILINE_INDICATOR = $"|| "
