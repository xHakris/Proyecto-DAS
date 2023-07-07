import React, { useState, useEffect, createRef } from "react";
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  ScrollView,
  Dimensions
} from "react-native";
import DateTimePickerModal from "react-native-modal-datetime-picker";
import { doc, getDoc } from "firebase/firestore/lite";
import { auth, db } from "../firebase";
import QRScanner from "../components/QRScanner";
// import { useIsFocused } from "@react-navigration/native";

// import { BarCodeScanner } from 'expo-barcode-scanner';

// export default function QRScanner() {
//   const [hasPermission, setHasPermission] = useState(null);
//   const [scanned, setScanned] = useState(false);

//   useEffect(() => {
//     (async () => {
//       const { status } = await BarCodeScanner.requestPermissionsAsync();
//       setHasPermission(status === 'granted');
//     })();
//   }, []);

//   const handleBarCodeScanned = ({ data }) => {
//     setScanned(true);
//     alert(`Scanned QR code: ${data}`);
//   };

//   if (hasPermission === null) {
//     return <Text>Requesting camera permission</Text>;
//   }
//   if (hasPermission === false) {
//     return <Text>No access to camera</Text>;
//   }

//   return (
//     <View style={styles.container}>
//       <BarCodeScanner
//         onBarCodeScanned={handleBarCodeScanned}
//         style={StyleSheet.absoluteFillObject}
//       />
//       {scanned && <Text style={styles.scanText}>Scan complete!</Text>}
//     </View>
//   );
// }

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     flexDirection: 'column',
//     justifyContent: 'center',
//   },
//   scanText: {
//     fontSize: 20,
//     color: 'white',
//     textAlign: 'center',
//     backgroundColor: 'rgba(0, 0, 0, 0.7)',
//     padding: 10,
//   },
// });




const FindScreen = () =>{

  return (
    <QRScanner/>
  )
}

export default FindScreen