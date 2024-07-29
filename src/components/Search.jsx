import styled from "styled-components";
import { useState } from 'react';
import { FaSearch } from 'react-icons/fa';
import {useNavigate} from 'react-router-dom';

function Search() {

  const [input, setInput] = useState("");
  const navigate = useNavigate();

const submitHandler = (e) => {
  e.preventDefault();
  navigate('/searched/'+input)
};

  return (
    <FormStyle onSubmit={submitHandler}>
      <div>
      <FaSearch></FaSearch>
        <input onChange={(e) =>setInput(e.target.value)}
        type="text" value={input} />
      </div>
      </FormStyle>
  );
}
const FormStyle = styled.form `
  margin:0.5rem 2rem;
  width:100%;
  display:flex;
  align-items:center ;
  justify-content:center ;

  div{
    width: 100%;
    position: relative;
    display:flex;
  align-items:center ;
  justify-content:center ;
  }

  input{
    border:none;
     background: linear-gradient(35deg, #494949, #313131);
     width:100%;
     font-size:1.5rem;
     color:white;
     padding: 1rem 3rem;
     border:none;
     border-radius:1rem;
     outline:none;
  }
  svg{
    position: absolute;
    top:25% ;
    left:0%;
    color:white ;
    transform: translate(100%, 50%) ;
  }

`;

export default Search