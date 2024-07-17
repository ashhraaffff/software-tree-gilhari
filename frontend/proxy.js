const express = require('express');
const request = require('request');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

app.use(bodyParser.json());

// CORS headers setup
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

// Handle pre-flight OPTIONS request
app.options('*', (req, res) => {
    res.sendStatus(200);
});

// Proxy middleware
app.use((req, res) => {
    if (req.headers.upgrade && req.headers.upgrade.toLowerCase() === 'websocket') {
        res.status(400).send('WebSocket connections are not supported');
        return;
    }

    const url = 'https://onlinebookstore.jollytree-b7a870f9.centralindia.azurecontainerapps.io' + req.url;

    const options = {
        url: url,
        method: req.method,
        headers: {
            'Content-Type': req.headers['content-type'] || 'application/json'
        }
    };

    if (req.method === 'POST' || req.method === 'DELETE') {
        options.body = JSON.stringify(req.body);
    }

    // Proxy the request
    const proxyRequest = request(options);

    // Pipe the incoming request to the external API and pipe the response back
    req.pipe(proxyRequest)
        .on('error', (err) => {
            console.error('Proxy request error:', err);
            res.status(500).send('Proxy request error');
        })
        .pipe(res)
        .on('error', (err) => {
            console.error('Response error:', err);
        });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Proxy server is running on http://localhost:${PORT}`);
});
