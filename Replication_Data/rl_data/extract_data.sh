#!/bin/zsh
#
for filename in ./*.out
do
   file=${filename%.*}
   file=${filename#\.\/}
   echo ${file%.*}.csv
   
   echo 'steps,reward,error' > ${filename%.*}.csv
   grep episode_reward ${filename} >> ${filename%.*}.csv
   #sed -e 's/Eval.num_timesteps=//g' -e 's/+\/-/,/g' -e 's/ //g' -e 's/episode_reward=//g' ${filename%.*}'.csv'
   sed -i -e 's/Eval.num_timesteps=//g' ${file%.*}.csv
   sed -i -e 's/+\/-/,/g' ${file%.*}.csv
   sed -i -e 's/ //g' ${file%.*}.csv 
   sed -i -e 's/episode_reward=//g' ${file%.*}.csv
done
rm *.csv-e

