// Install event for service worker
self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open('v1').then(function(cache) {
      return cache.addAll([
        '/index.html',
        '/styles.css',
        '/script.js',
        '/social.png',
        '/favicon.ico',
        '/app.webmanifest'
        // Add other resources to cache
      ]);
    })
  );
});

// Fetch event for service worker
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      // Cache hit - return response
      if (response) {
        return response;
      }

      // Fetch and cache new requests
      return fetch(event.request).then(function(response) {
        // Check if we received a valid response
        if (!response || response.status !== 200 || response.type !== 'basic') {
          return response;
        }

        // Clone the response to use it and cache it
        var responseToCache = response.clone();

        caches.open('v1').then(function(cache) {
          cache.put(event.request, responseToCache);
        });

        return response;
      });
    })
  );
});
