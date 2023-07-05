
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


  export const useDebounce = (value, delay) => {
    const [debouncedValue, setDebouncedValue] = useState(value);
  
    useEffect(() => {
      const timer = setTimeout(() => {
        setDebouncedValue(value);
      }, delay);
  
      return () => {
        clearTimeout(timer);
      };
    }, [value, delay]);
  
    return debouncedValue;
  };

  export const useLocalStorage = (key, initialValue) => {
    const [value, setValue] = useState(() => {
      const storedValue = localStorage.getItem(key);
      return storedValue ? JSON.parse(storedValue) : initialValue;
    });
  
    useEffect(() => {
      localStorage.setItem(key, JSON.stringify(value));
    }, [key, value]);
  
    return [value, setValue];
  };
  