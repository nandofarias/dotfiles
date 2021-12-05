function asdf_current --argument-names lang
    set current (pwd)
    set versions
    set root (dirname $HOME)

    env_lang_version=ASDF_(string upper $lang)_VERSION set env_version $$env_lang_version

    if test -n "$env_version"
        echo $env_version
        return 0
    end

    while test "$current" != "$root"
        if test -e $current/.tool-versions
            set -a versions (string split "\n" < $current/.tool-versions)
        end
        set current (string join "/" (string split "/" $current)[..-2])
    end

    for ver in $versions
        if string match --quiet "$lang *" $ver
            echo (string split -f2 " " "$ver")
            return 0
        end
    end
end
