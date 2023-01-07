MODDIR=${0%/*}
DIR0="/product/etc/device_features"
DIR1="/vendor/etc/device_features"
VAR0='name="is_only_support_keycode_goto"'

for xml in "$DIR0"/*.xml "$DIR1"/*.xml; do
  if [ -f $xml ] && grep -q "$VAR0" $xml; then
    XMLDIR="$MODDIR/system/$(dirname $xml)"
    mkdir -p "$XMLDIR"
    [ $(ls -A "$XMLDIR") ] && rm -rf "$XMLDIR"/*
    cp -f $xml "$XMLDIR"
    sed -i s/"$VAR0"'>true<'/"$VAR0"'>false<'/ "$XMLDIR/$(basename $xml)"
  fi
done
