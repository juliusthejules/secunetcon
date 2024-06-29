const CACHE_NAME = 'secunetcon-cache-v3';
const urlsToCache = [
    './',
    './index.html',
    './styles.css',
    './social.png',
    './favicon.ico',
    './icon-192x192.png',
    './icon-256x256.png',
    './icon-384x384.png',
    './icon-512x512.png',
    './app.webmanifest'
];

// Install the service worker
self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => {
                return cache.addAll(urlsToCache);
            })
    );
});

// Cache and return requests
self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => {
                return response || fetch(event.request);
            })
    );
});

// Update the service worker
self.addEventListener('activate', event => {
    const cacheWhitelist = [CACHE_NAME];
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cacheName => {
                    if (!cacheWhitelist.includes(cacheName)) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});
