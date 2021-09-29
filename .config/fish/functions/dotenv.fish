function dotenv --description 'Sources a dotenv file. E.g dotenv .env'
    command env (cat $argv) fish
end
