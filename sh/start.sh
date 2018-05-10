#!/usr/bin/env sh

export PASSWORD=${PASSWORD:-jupyter}
export sha1=`python3 -c "import IPython;import os;print(IPython.lib.passwd(os.environ.get('PASSWORD')))"`
echo $PASSWORD
cat << END > /root/.jupyter/jupyter_notebook_config.py
c = get_config()
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 80
c.NotebookApp.password = '${sha1}'
c.NotebookApp.notebook_dir = '/'
END

jupyter notebook --allow-root