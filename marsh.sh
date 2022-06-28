#!/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

bzshtmpdir=
trap 'res=$?
  test -n "$bzshtmpdir" && rm -fr "$bzshtmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d $TMPDIR && test -w $TMPDIR && test -x $TMPDIR || TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
  */tmp) TMPDIR=$TMPDIR/; test -d $TMPDIR && test -w $TMPDIR && test -x $TMPDIR || TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
  *:* | *) TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
esac
if type mktemp >/dev/null 2>&1; then
  bzshtmpdir=`mktemp -d "${TMPDIR}bzshtmpXXXXXXXXX"`
else
  bzshtmpdir=${TMPDIR}bzshtmp$$; mkdir $bzshtmpdir
fi || { (exit 127); exit 127; }

bzshtmp=$bzshtmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bzshtmp" && rm -r "$bzshtmp";;
*/*) bzshtmp=$bzshtmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bzshtmp"; then
  umask $umask
  chmod 700 "$bzshtmp"
  (sleep 5; rm -fr "$bzshtmpdir") 2>/dev/null &
  "$bzshtmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  (exit 127); res=127
fi; exit $res
BZh91AY&SY��!�  ������������������������������������/ �v��gGF� �&���z�0��M��hɣjz��6���Hi�j�1��F�4�M20CLji�2��f�jd�#�i�z�`h'�bbz&�̡DJdڍ��2i�S@i���6�h�@z��=@����OHf��=���=�Q�z���&FC3Q�z@44 �h�� 1����2i�Fz��G����4&M6���F��i3P��hhFi&@i���m4 Fh��	�1�zM3F�̑��	��$�0                             H��ɣS�Ƅ�M���0S�Se=OI�?SH�CI�O(�M2=G��= h���=A�M=CO(��MM4y�m'��=A�m#Mhh�z�z�E�N4 ���J$�G{#.ʬ�u��.3'ߙ�*���[>GB}�6jRS��Ǻ�#�²��Lj�>�5� eY��Re��d��%���hp""E
?[�,[_@!,��:�~N���-<{��g4D\~
-�ƫ	3�s��/��[g���H:@t�,s}6,j�DW�5�;��#�&���:[Y�w\�9y�c�).�c�y�n��z�������3�Z�,����:����?N:��R4����XXa��D�u�Z%�s�PL��R��DG��.����Z�Z���2B���5:a�s�+�����Zݘ�8]�7,7i��B$;f���� �VȲG�]'q�r?ae���ð���_X���>��Z!�B�M�����}��s! <��K (�!B��V��B�y�X��*��w��M,C@:�9Q�p.v�˨�;G��Q�"T��X檖q3��|���d��T��sÕ�����7."�>!jA:�ϩ�)8~�uP����Wo��.�2���*0��n�Y(��$��fm�͙h�ym�-_7��`�L�c�b�yc�
�'h Z�R�CJ� �y����p��!3��-�}�#6_�r��d�i��#���Ѱ���Y�i�5�4�lҨ7
�q���*s��H�,s(��&�\�7�T����ŕ@�f
�v7�����Y.vK���#@:�?�Q�nN���ˀ0`��M}�!�5��'�N5b�k������@�qm���Ii;��� !���迧R�!	2j�=rQ�.X�����<3�^6�L3j�
����N��I}ա2jȑ$G��Ik��@@�C�q����r�O�����$�&�7Jn�c����?�������s 6�뤄�����   H$7q#�r=|?����^gZ�#�p�H�M�>R�|V3�
���PD"D�ɉ�G�e�+����t;;qP��py�'�Z{�.8����4��dj��6M��A�����C�R P-Kk���1���I-c$�m
�[�mۃƎ���̹ ����AFT@����z ����Q� a��q�A�l�M�7��j�����w�5��/B���	� P�����ccG�2F�@�ȉ[~	� u\����HhZ
K���~=Z�H@����ܼ�Q)|dY_š���)�!����� CN�B�	��%�Z�8��]Ǵ3)��g,�\�(��(���M[;
�w��/�
`��� tq�����Ɗ�M�����%�"E(�^a� a�`F�BB���p�,)h  L�� �yC������'���4S�m�d-�!M��yp sc�ƜծE	��m�cĀ\֡�j
 �(��+�uy�`����x���Z���NQ��4ӎB�咬2�x�n1�lP�tE�F�U"Yй���g�G��8�Y{���8!T�M�������k�R=�j��Ҽ^[��1Q��]����+���Ď�����Ɣ�HIsla�è ڌ�c�@�5|�gRe�mD���@n/|I�,U�-5ќ�L�l��QM+B�(h44FSMN�3l� ���a�&g���/���|����I��ׄ�U��NH4�FH��v �
��R�1�?V=k�NR��W/:���Y�m��LT�y�d�� �4H� ����Gp���f�d��j�5%y�C�C]G2�ۡ���r�&���i`���̊�s_��f}H�WَE~"�CR*��*���9�`� ��i~ճ�9�Fc�ȿ�iJ��G���0���n_C)��ʫaZ��R��T�	t��żOe�e���
���Q`�G�E� �ȣ��I+�F�\�J�N!������a��L�Ɍ��~��baM�$�4=�Nz��(����!��Z��C�M�=)���~X �4A
*nѰ7����E�LoVP�ٸL7[7k���3�L��txĴ�C�-q.��-H/o��{�.߱�����O��J�Q����8�DY�z�ɧ�J�_˗&�-�R�^����.�p�!?�C�