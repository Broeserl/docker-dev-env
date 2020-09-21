#!/bin/bash

name=ubuntu-dev

if [ $# -eq 1 ]
  then
    name="$1"
fi

get_config_files()
{
  mkdir config 
  wget https://gist.githubusercontent.com/Broeserl/fc04ca80ca8d6268225ab96c7cd0ea08/raw/154b9223aeb6c259e823f9672c829c0b82601119/.jo_config -P config
  wget https://gist.githubusercontent.com/Broeserl/2894df8f5c1c51346434ac03b3e8d90e/raw/95152f851fd66684d2469d00ef2bcc86c7de4d00/.aliases -P config
  wget https://gist.githubusercontent.com/Broeserl/3f291ce1f5455c8fe84a0e1f68c49942/raw/99925382ffe1482801aebeb65017f3ca33c5544d/.vimrc -P config
  wget https://gist.githubusercontent.com/Broeserl/a1956af3cf5be215b1f5079f94fd8c20/raw/73ec472d992387781ea5df12f05071f188fc6511/.screenrc -P config
  wget https://gist.githubusercontent.com/Broeserl/1bf83d91ab88c173a7f5aee40128cc05/raw/a30bbd79c013e4f334f36a5036856016df31aad4/.gitconfig -P config
}

get_config_files
docker build -t $name .
