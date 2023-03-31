MODDIR=${0%/*}
# Key-Selector addon starting
. $MODPATH/addon/Volume-Key-Selector/install.sh
ui_print " "
sleep 1
ui_print "    Volume up (+) to change selection"
ui_print "    Volume down (-) to decide"
ui_print " "
sleep 1
ui_print "    What target YouTube app to use?"
sleep 1

A=1
  while true; do
    case $A in
      1) TEXT="    Original or Root/Modded versions of YouTube";;
      2) TEXT="    Non Root YouTube reVanced";;
    esac
      ui_print "    $A - $TEXT"
        if $VKSEL; then
          A=$((A + 1))
        else
          break
        fi
        if [ $A -gt 2 ]; then
          A=1
        fi
  done

  case $A in
    1) echo "    Original or Root/Modded versions of YouTube App" > $MODPATH/app.log; rm -r $MODPATH/revanced; mv $MODPATH/original $MODPATH/temp;;
    2) echo "    Non Root YouTube reVanced App" > $MODPATH/app.log; rm -r $MODPATH/original; mv $MODPATH/revanced $MODPATH/temp;;
  esac
ui_print " "
ui_print "*******************"
sleep 3
ui_print "    What theme to use?"
ui_print " "
sleep 1
A=1
  while true; do
    case $A in
      4) TEXT="    MaterialYou Theme";;
      3) TEXT="    Grey Theme";;
      2) TEXT="    Dark Grey Theme";;
      1) TEXT="    Black Theme";;
    esac
      ui_print "    $A - $TEXT"
        if $VKSEL; then
          A=$((A + 1))
        else
          break
        fi
        if [ $A -gt 4 ]; then
          A=1
        fi
  done

  case $A in
    1) echo "    Black Theme YouTube Overlay" > $MODPATH/install.log; mv $MODPATH/temp/BlackThemeYouTubeOverlay $MODPATH/system/folder/overlay/BlackThemeYouTubeOverlay;;
    2) echo "    Dark Grey Theme YouTube Overlay" > $MODPATH/install.log; mv $MODPATH/temp/DarkGreyThemeYouTubeOverlay $MODPATH/system/folder/overlay/DarkGreyThemeYouTubeOverlay;;
    3) echo "    Grey Theme YouTune Overlay" > $MODPATH/install.log; mv $MODPATH/temp/GreyThemeYouTubeOverlay $MODPATH/system/folder/overlay/GreyThemeYouTubeOverlay;;
    4) echo "    MaterialYou Theme YouTube Overlay" > $MODPATH/install.log; mv $MODPATH/temp/MaterialYouThemeYouTubeOverlay $MODPATH/system/folder/overlay/MaterialYouThemeYouTubeOverlay;;
  esac
# Result
ui_print " "
ui_print "*******************"
sleep 1
ui_print " "
ui_print "    You have selected:"
ui_print " "
cat $MODPATH/app.log
sleep 1
ui_print " "
cat $MODPATH/install.log
ui_print " "
ui_print "*******************"
sleep 1
ui_print " "
ui_print "    Clearing temporary directories"
# Clean temporary directory
rm -r $MODPATH/addon
rm -r $MODPATH/assets
rm $MODPATH/app.log
rm $MODPATH/install.log
rm -r $MODPATH/temp
sleep 1
ui_print " "
ui_print "*******************"
ui_print " "
# Finding directory of overlays
ui_print " "
ui_print "    Find target directory of the overlays ... "
ui_print " "
sleep 3
  if  [ -d  /system/vendor/overlay ]; then
    ui_print "    Overlays found in vendor"
    ui_print " "
    TARGET=$MODPATH/system/vendor
    mv $MODPATH/system/folder $MODPATH/system/vendor
    sleep 1
    ui_print "    Files will be copied to vendor"
    ui_print " "
  elif [ -d  /system/product/overlay ]; then
    ui_print "    Overlays found in product"
    ui_print " "
    TARGET=$MODPATH/system/product
    mv $MODPATH/system/folder $MODPATH/system/product
    sleep 1
    ui_print "    Files will be copied to product"
    ui_print " "
  else
    ui_print "    Overlays not found"
    ui_print "    Installation aborting"
    abort
  fi;
ui_print "*******************"
ui_print " "
sleep 1
