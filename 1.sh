#!/data/data/com.termux/files/usr/bin/sh
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���)a1.sh �W[OG~�_1l��!��(5ReUjKR��J�MU-�1v����"��(`��[H�`�R ���<��'�B�����p�<Բ���̙�ܾs�J�Qa�/XEC���8)�E��FT5�jG�ra�B�lW���V���#��odo:t�O�݄�1e���'��T��O����!�a��8��r�1���L��I8�L�)s����,�˚ф>�̈=C��tGn8�׏�Ԗ��G^,�Wd�'#�M�WH�8�[+�<d`P;��υj�����zj�H������x��[����<9|Yro���-���-r%Og�ɝB���6^����(���C_:0���[=��Q[ˠ�%�h��QY�aO�m{���~��1��T�`у����Ͽ����@*�*F��� u�ᣨ��/�p�R�U���XE�!1��UD��U�?�^�jB�1�7�J�`P�ʨ��Σ�{��ò��&�z�9;�����׌�KBHY��-�ኞ�5���czr�Hd�VR���/�dJ�Q��uĘ_C.fb@�܅�\��­`���U'CI+'�M���l�5%��.fL-�� bq������g��~������Ж���o-�<-��������䈷1jW��^�x�d�Z0��_�(�����}�Y��nd���E� �#��S�J02&x��
�P�R�ax�D{i����u]p�B#~�r�UiXI���Q��߫�P@������f.oB����g�������~}1�?9`�T���=�dr�K�Xf�2�����	�3&eTZ]%���D�auZ/1%�.����~������D�9���M�Q,��!�[�Q3�5��0֐c��(�O��j� ��Jh�v%�"�s�5_d(�bE
��5kE8�S�@�a�1�s��QA�Ȁ�F��qr�/ni���o�⊅{�&sh9äS��r.���+4I�X�_C�4����?��6P-�jQ����0v�i;հ�Q�u�k�"Yԉ�PD�pY���	��6�&	�[*(2���*�F޳�^� ���&�A(�� +���n��L�Ve32$��p��z�q�
�_}+A�):\O�"�w�� ��f������������N�z1oT&�������,����f? Z�e\�2���e�}��$�gٞ�3��⼹�*�>-�ބ�]��;ntt���ib�!�'�zc�3  