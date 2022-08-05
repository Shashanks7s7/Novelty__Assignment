
const firebase=require('firebase/app')
const firestore=require('firebase/firestore')
const firebaseConfig = {
  apiKey: "AIzaSyDXssgS1xHe3f8Z0jr2AU78y-Pq21GfTyI",
  authDomain: "leapfrog-c224d.firebaseapp.com",
  projectId: "leapfrog-c224d",
  storageBucket: "leapfrog-c224d.appspot.com",
  messagingSenderId: "40315277682",
  appId: "1:40315277682:web:62a81fb093130d79a34deb",
  measurementId: "G-FB7NYNRP0F"
};


const fire=firebase.initializeApp(firebaseConfig)

// const database=firestore();
const newsData= fire.firestore
module.exports=newsData