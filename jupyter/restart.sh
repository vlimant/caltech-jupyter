## kill all previous processes
kill -9 `ps -u $USER -f | grep jupy | awk '{print $2}'`

#and restart in loop
while [ 1 == 1 ]; do
    there=`ps -u $USER -f | grep jupyter-notebook | grep $USER | wc -l `
    if [ $there -gt "1" ] ; then
	echo "still running"
	sleep 10
    else
	echo $there
	ps -e -f | grep jupy
	echo "restarting"
	source /usr/local/bin/thisroot.sh ## if root is present indeed
	export PYTHONPATH=$PYTHONPATH:/data/shared/Software/
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/targets/x86_64-linux/lib/
	jupyter notebook --config /etc/jupyter/jupyter_notebook_config.py
	sleep 120
	echo "after sleep"
	ps -e -f | grep jupy
    fi
done
