function import_gpg_keys --description 'Import gpg keys using keybase'
    keybase pgp export | gpg --import -
    keybase pgp export -s | gpg --allow-secret-key-import --import -
end
