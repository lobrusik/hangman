const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.createPlayerDocument = functions.firestore
  .document('users/{userUID}')  //Śledź dokumenty w ścieżce users
  .onCreate((snapshot, context) => {
    const userId = context.params.userId;

    // Uzyskaj dostęp do danych nowego użytkownika
    const userData = snapshot.data();

    // Dodaj użytkownika do kolekcji "players" z domyślnym poziomem
    return admin.firestore().collection('players').doc(userId).set({
      email: userData.email,
      level: 1,  // Domyślny poziom dla nowego użytkownika
    });
  });
