function npmg --description "Global npm packages the right way"
  cd $HOME/.npmbin
  npm $argv --save-dev
  cd -
end
