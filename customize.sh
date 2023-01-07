DIR0="/product/etc/device_features"
DIR1="/vendor/etc/device_features"
VAR0='name="is_only_support_keycode_goto"'

for xml in "$DIR0"/*.xml "$DIR1"/*.xml; do
  if [ -f $xml ] && grep -q "$VAR0" $xml; then
    echo "- Found the required value."
    VAR1=0 && break
  fi
done

[ -z $VAR1 ] && echo "- Error: The required value was not found."
