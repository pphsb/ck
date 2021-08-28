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
�M�)a2.sh �W[OG~�_1l��I앝r��*�R[HᡕJ��Z�c���vׄ����K��I�
��_*�z����3;�+�\)�,�}<s�;��"DY�Câ��8ɏE��F%�nE�qa�B6�,����R���$�W�`�pr�M����=����͹b*K��.�ւ!7�a���8��M9V���f����H���픱���l��g�hB�}�Ǟ��!ii�l:�7���t@^���Gd�g=�K&�H촐�(�=b`P;��ρjז
��ZjOO���������6,v�b-�@�_���.k��Zj��E��Ycj���%~-nL4(�
�h@5���+���nQ��Fې�-`ks[QE�qO�k���~��1��T$cэlA���/������@*�
F�U�A��GI_���)�$��/B���GbX�*��������<�kԂl�om�B��(c�+���E�ͥu	o.�2���dN[:��g��XBʒ_���ִ�o��E�i�-=�%;yH�b~��˔��+�q���D���K��/�[�O߬M��VNz��W��r������1��������W�>S���^x8C[Nv
���{Z̽��M�����w1j���^�t�d�Z0��^l(��+�������nd���A� �#��]�r 2.x|~��P ���xzE�i����x_p�B�>��Sh�I��i�Q��Y?��P@���5��a�>� ���/<W�u�t]�3��r��;b�T�0��p�dr�+�Xa�
��T�3&eTZ[%���D�a��/19����������p�UQ��?|k�F�
9uL旵D��D�M�?�Ud�4
�Uհ�##ް`��BY&���#>��(X�BAUsE8�U�A�a�3�w��1!��9���y��&ds]��:\}����J�{�.sh9äS��J.���4I���_G�4����?��6P-�jR���|0v�h;U��R��k�,�ԉ�PD�pE���	��6�*	�[*(1����
�F?��^����6�Q(��J ����n�(�N�fe32$��t��z�~��_ۄ�� ��'_�X�508��&�$I�G���@Hus@x�C;\��7��Gv�csIg�|��o� ��2�j\���>VC��3��Nj�Dqy�X����b�U���/�o��~GGWWw������i�л!�'��O=  