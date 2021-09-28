function dotenv --wraps='env (cat ) fish'
    command env (cat $argv) fish
end
