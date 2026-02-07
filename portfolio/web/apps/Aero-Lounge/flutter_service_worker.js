'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "30cdc8f1d6a5eaae19910ef5f2851f48",
"assets/AssetManifest.bin.json": "ab0be46db66ac5be0c05476ddec1d8ea",
"assets/AssetManifest.json": "d61101107f339183407c3612619eafce",
"assets/assets/aircraft/aircraft_1.png": "d8071de743bb14128abced49d55d788a",
"assets/assets/aircraft/aircraft_2.png": "e5f5c80f0701c800e7edd9e93ca89a2e",
"assets/assets/aircraft/aircraft_3.png": "743e7929e7f92db49f7c22fab7fe6c4e",
"assets/assets/aircraft/airport_radar_icon.png": "601d673e9bf1ed21ddfb94cd21407e0f",
"assets/assets/aircraft/airport_radar_icon.svg": "85f702b391f6ced4fd324646796697bc",
"assets/assets/aircraft/back_clock_icon.svg": "aa63d6de2473c855ceb1234834d0f826",
"assets/assets/aircraft/bookmark_active_icon.png": "7cf6c2a34ba7dfa0af0b1507e33981fa",
"assets/assets/aircraft/bookmark_inactive_icon.png": "66d54be5839120b10b6545ddf8f22572",
"assets/assets/aircraft/calender_icon.svg": "203b3df29b46f725fced1012a09fd7d1",
"assets/assets/aircraft/card_icon.svg": "f8c33a625c8c1128e67b09c286479b8c",
"assets/assets/aircraft/clock_icon.svg": "7c2b3dacbab962becb93c2d06d271b0c",
"assets/assets/aircraft/dollar_icon.svg": "81e8a3195f0bcda8a2e79be5327e9154",
"assets/assets/aircraft/payment_tick_icon.svg": "d7566e68ecfd33e9417c293da80992d6",
"assets/assets/aircraft/plane_icon.svg": "35e0cdaf6e3b518e8f28562b97c560f8",
"assets/assets/aircraft/reschedule_icon.svg": "22928690c577e82c257a08841821760a",
"assets/assets/aircraft/visa_card_icon.svg": "7d091dab11b11292f67c8443ea009249",
"assets/assets/create_account/back_icon.svg": "65fb540d7ee1e2478a586d2f237ca2a1",
"assets/assets/create_account/camera_icon.svg": "efcceaeb5c74aa010b454ad93afe596f",
"assets/assets/create_account/checked_active_icon.svg": "88172632a6147da732aa57e1acf06fe4",
"assets/assets/create_account/checked_inactive_icon.svg": "d92b1e421f9dffdd049c0ceb6c683f4e",
"assets/assets/create_account/drop_down_icon.svg": "47571db9d7f6e7f9252cf026e71e8e40",
"assets/assets/create_account/information_icon.svg": "4ef48c249e4929083390293a74bcce04",
"assets/assets/create_account/upload_icon.svg": "70a324f66e428f5155a1c754d3f3d145",
"assets/assets/create_account/user_icon.svg": "07aa7d65489342a1961125c719792315",
"assets/assets/create_account/warning_icon.svg": "ae8c2fc05e9d1e174ec7994251e3598f",
"assets/assets/dashboard/aircraft_image.png": "ccd1176cb0d75ae77ed6db0fdb0a0f22",
"assets/assets/dashboard/aircraft_zoomed_out_image.png": "382495e0de64fc02ba038582e8162ae0",
"assets/assets/dashboard/dance_image.png": "fa52b81df8ab0ce1bb500097208a6306",
"assets/assets/dashboard/dashboard_user_image.png": "b2d3423377dab6d972fbdacd935091d4",
"assets/assets/dashboard/flight_club_icon.svg": "0afe724ec4982d5855e07e1ff1d8e1ba",
"assets/assets/dashboard/half_rating_star_icon.svg": "8e461f3034647fa932c4437454d2005d",
"assets/assets/dashboard/notification_icon.svg": "3d24b20b1e431b7bd383e0e25976525c",
"assets/assets/dashboard/rating_star_icon.svg": "9b464dcaa8937f43610929c6a7a9e92b",
"assets/assets/dashboard/search_icon.svg": "ca1b33f090f468204cde33dd0b0020d1",
"assets/assets/dashboard/study_group_icon.svg": "a8e141c301dc98f682e2eed6ee0f3e5b",
"assets/assets/dashboard/twin_plane_image.png": "10316b476a5862e340f596f9eaf9f227",
"assets/assets/login/apple_login_icon.svg": "f83f9579dbf1f20a4b611670f911593d",
"assets/assets/login/attachment_icon.svg": "6ec079154f0068898fa9609f0334a21c",
"assets/assets/login/download_icon.svg": "196ed1f01f44ef9b1eaf0dfc38c01256",
"assets/assets/login/google_login_icon.svg": "6864cc986e75db85c2391ca08692cabf",
"assets/assets/login/issue_escalated_icon.svg": "98cebbb68b5ffe8b8bfa6b20d2e2ba8f",
"assets/assets/login/logout_icon.svg": "981a64c2751dad163ab39d746b24f49b",
"assets/assets/login/message_icon.svg": "ac20382baf924364577a9b876577d115",
"assets/assets/login/send_icon.svg": "2ba2640cf9c31a4358c72ef7daf570a3",
"assets/assets/login/user_profile_picture.png": "0f49f8b8ed85abcefe47ba58b05293fe",
"assets/assets/onboard/aircraft_owner_icon.svg": "504ad526e065fe7dee393d62a2b477ba",
"assets/assets/onboard/onboard_background.png": "910d786262b72a8a8a595904fd76d20b",
"assets/assets/onboard/onboard_logo.png": "5eec5077d725e9e415a84178aa7e0ab8",
"assets/assets/onboard/pilot_icon.svg": "90af5e3f64b02bfef7ce14985fa0c48b",
"assets/assets/root/drag_handle_icon.svg": "92d85fd686590611fd4608dae520601b",
"assets/assets/root/exclaimation_icon.svg": "cd7d67132df76974c377fab30ab40133",
"assets/assets/root/filter_icon.svg": "e15bff899341cf7389cb8c2c56850b2a",
"assets/assets/root/flight_takeoff_icon.svg": "09b3dbab4923dfcdefd0e423fd6e00ef",
"assets/assets/root/forward_arrow_icon.svg": "d066e91a47f61e29cbd6ebf52571f4d3",
"assets/assets/root/hanger_icon.png": "641ab8110e49f78addc4f808311e0653",
"assets/assets/root/hanger_icon.svg": "052d5d91303613b60085b4de337a27b1",
"assets/assets/root/logbook_icon.svg": "071bd3cff816cce79ed0d40c77ab65c3",
"assets/assets/root/profile_icon.svg": "17af570c60bae895f109c01f590f8206",
"assets/assets/root/saved_icon.svg": "3d1236a07e144bfed399e560070cd267",
"assets/assets/root/search_icon.svg": "ab909a8be75fc512af15fbff95d16ad1",
"assets/assets/splash/splash_cloud_image.png": "699efeb6024f1ac07373e79254498ae7",
"assets/assets/splash/splash_logo.png": "167cd4af6d84ae57c659f51f8d1562ff",
"assets/assets/subscription/tick_icon.svg": "8926ba9cdfc42c5d4db577d7e473d550",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2cff15706eccaba5bda19bd9262294f5",
"assets/NOTICES": "431aac64c90c902368d2734178ba16ca",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "c22c39d49fd0dafe5528b6fb07065d66",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0181b6a5b142db7bf1e399d31650eba5",
"/": "0181b6a5b142db7bf1e399d31650eba5",
"main.dart.js": "f0d4e269519b230417843839cecea5a5",
"main.dart.mjs": "88d89f28857a0c06089aa1eeb9ecac44",
"main.dart.wasm": "5c57712f32180b014549f6e7d7487e06",
"manifest.json": "732502b23abaedde775fd68767d7b096",
"version.json": "520a0df3a4af91037f17e3d040b01dd1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
