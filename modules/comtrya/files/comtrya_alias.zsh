# ca

function ca (){
  UNIT="$1";
  cd -- $HOME/env
  # check if exist
  if [ "$UNIT" = "all" ]
    then
      comtrya -d modules apply
      comtrya -d private apply
  fi
  
  if [ -z "$UNIT" ]
  then
      echo look for $UNIT
      # apply current
      comtrya apply
  else
    # check if file exist
    public_file=$HOME/env/modules/$UNIT/$UNIT.yml
    private_file=$HOME/env/private/$UNIT/$UNIT.yml
    echo check $public_file if exist
    if [ -f "$public_file" ] 
    then
      module_name="modules.$UNIT.$UNIT";
      comtrya apply -m $module_name
    fi
    echo check $private_file if exist
    if [ -f "$private_file" ]
    then
      comtrya apply -m "private.$UNIT.$UNIT"
    fi
    
  fi 
}
