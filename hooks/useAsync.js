
import { useEffect } from "react"

export const useAsync = (asyncFn, onSuccess)=> {
    useEffect(() => {
      let isActive = true;
      asyncFn().then(data => {
        if (isActive) onSuccess(data);
      });
      return () => { isActive = false };
    }, [asyncFn, onSuccess]);
  }