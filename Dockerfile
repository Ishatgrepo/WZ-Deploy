FROM mysterysd/wzmlx:v3

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN uv venv --system-site-packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \     
    unzip \
    p7zip-full \
    rar \
    unar \
    unrar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*    
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
