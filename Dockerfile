# SMDM pa11y-dashboard Docker Container

FROM node:20

LABEL Jakob Osterberger <jo@studiomitte.com>

# Install dependencies
RUN apt update -y && apt upgrade -y && apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget net-tools git

# Set environment variables
ENV NODE_ENV ${NODE_ENV:-production}

# Download the dashboard application
RUN git clone https://github.com/pa11y/dashboard.git && cd dashboard && npm i

EXPOSE 4000
EXPOSE 3000

COPY production.json /dashboard/config/production.json

# Start the web server
WORKDIR /dashboard
CMD node .
