import React from "react";
import {  Text} from "react-native";
// import { NavigationContainer} from '@react-navigation/native';
import LoginScreens from "./screens/LoginScreens";
import { ListUserContext } from "./context/ListUserContext";
import { UserContext } from "./context/UserContext";
import { ConfigContext } from "./context/ConfigContext";
import { NavigationContainer } from "@react-navigation/native";

import { createNativeStackNavigator } from "@react-navigation/native-stack";




const Stack = createNativeStackNavigator();

export default function App() {
  const [isAuthent, setIsAuthent] = React.useState(false);
  const [data, setData] = React.useState({});
  const [dataUser, setDataUsers] = React.useState({});

  return (
    
     
    <UserContext.Provider value={{isAuthent, setIsAuthent}}>
        <ConfigContext.Provider value={{data,setData}}>
        <ListUserContext.Provider value={{dataUser,setDataUsers}}>
      <NavigationContainer>
          <Stack.Navigator>
              <Stack.Screen
                screenOptions={{
                  headerStyle: { height: 100, backgroundColor: "black" },
                }}
                options={{ headerShown: false }}
                name="Login"
                component={LoginScreens}
              />

          </Stack.Navigator>
      </NavigationContainer>
      </ListUserContext.Provider>
      </ConfigContext.Provider>
    </UserContext.Provider>
    
  );
}
