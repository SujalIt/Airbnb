importScripts('https://www.gstatic.com/firebasejs/10.8.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.8.1/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyCLYpGpFKdkApEuSgibWRnxWjwSMdUroTw",
  authDomain: "airbnb-a667b.firebaseapp.com",
  projectId: "airbnb-a667b",
  storageBucket: "airbnb-a667b.firebasestorage.app",
  messagingSenderId: "9954417221",
  appId: "1:9954417221:web:5422622bd4ce2b0a37e12c",
});

const messaging = firebase.messaging();
