
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
  const mostrarIntegrantes = Object.values(integrantes).map((valor, index) => {
    return <ListContainer key={index}>{valor.correo}</ListContainer>;
  });

    return(
      <View>
         <Text>{"TIpom "+tipo}</Text>

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