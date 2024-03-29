
import React, { useEffect } from "react";
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
} from "react-native";
import ActivityContainer from "../components/ActivityContainer";
import ListContainer from "../components/ListContainer"
const ActivityDetailsScreen = ({route}) => {

  const { tipo } = route.params;
  const { integrantes } = route.params;
  const { responsable } = route.params
  const {diasDuracion} = route.params;
  const {nombre} = route.params;

  const mostrarIntegrantes = Object.values(integrantes).map((valor, index) => {
    return <ListContainer key={index} {...valor} diasDuracion={diasDuracion}  responsable={responsable} nombreEventoa={nombre}/>;
  });

    return(
      <View
        style={{
          display: "flex",
          alignItems: "center"
        }}
      >
          <Text style={{ fontWeight: 'bold', fontSize: 24 }}>Lista De Estudiantes</Text>


        {/* {integrantes.length > 0 ?
     (
        (integrantes.map((item,index) => {
            return (
                <Text>{item}</Text>
            )
        }))
      ):null
     } */}

      {mostrarIntegrantes}
      </View>
       

    )
};

export default ActivityDetailsScreen;