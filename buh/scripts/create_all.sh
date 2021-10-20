echo "uninstalling hub..."
python3 -m pip uninstall hub -y || python -m pip uninstall hub -y

rm -rf ./datasets/

export BUGGER_OFF="true"
BASEDIR=$(dirname $0)
SCRIPT=$BASEDIR/../create_current_version.py

for i in \
    2.0.2 \
    2.0.3 \
    2.0.4 \
    2.0.5 \
    2.0.6 \
    2.0.7 \
    2.0.8 \
    2.0.9 \
    2.0.11 \
    2.0.12 \
    2.0.13
do
    echo "\ninstalling hub version $i..."
    python3 -m pip install hub==$i || python -m pip install hub==$i
    echo "creating dataset for hub version $i"
    python3 $SCRIPT || python $SCRIPT
done

echo "\nfinished creating datasets for all versions!\n"

# in case the user used `pip3 install -e .` before they ran this
echo "uninstalling hub..."
python3 -m pip uninstall hub -y || python -m pip uninstall hub -y
