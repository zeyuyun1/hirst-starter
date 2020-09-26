# # files=(p1/*.bmp)
# # total=${#files[@]}
# # i=0
# # for f in "${files[@]}"; do
# #     # i=$(( i + 1 ))
# #     echo index $i
# #     echo total $total
# #     echo "- Processing file: $f"
# # done
# for (( c=1; c<=10; c++ ))
# do
# 	filename = 'group_$c'
# 	for ((c=1;c<= 6; c++));
# 	do
# 		echo
# 	done
# done


# b = 1
# mkdir "./pic/p1/g$b"
# for (( c=1; c<=60; c++ ))
# do
# 	mv "./pic/p1/$c.bmp" "./pic/p1/g$b"
# 	if ! ((c % 6)); then
#         # echo "$c divisible by 4."
#         b=$(( b + 1 ))
#         mkdir "./pic/p1/g$b"
#     fi
# done

# b=1
# for (( a=1; a<=9; a++ ))
# do
# 	mkdir "./pic/p$a/g$b"
# 	for (( c=1; c<=60; c++ ))
# 	do
# 		mv "./pic/p$a/$c.bmp" "./pic/p$a/g$b"
# 		if ! ((c % 6)); then
# 	        # echo "$c divisible by 4."
# 	        b=$(( b + 1 ))
# 	        mkdir "./pic/p$a/g$b"
# 	    fi
# 	done
# 	b=1
# done



# # convert -delay 2 -loop 0 *.bmp myimage.gif

for (( a=1; a<=9; a++ ))
do
	cd "p$a"
	for (( c=1; c<=11; c++ ))
	do
		convert "-delay 2 -loop 0 ./g$a/*.bmp g$c.gif"

	cd ".."
	done
done

# convert "-delay 2 -loop 0 ./g1/*.bmp g1.gif"