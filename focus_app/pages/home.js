import React from 'react';
import './styles.css';
import {useState} from 'react';

import pic1 from images;
import Button from './button';

const Home = () => {
  return (
    <div className="blueBG">
      <h1 className="mainFont">StudyStream</h1>
      <p>hopepage.</p>
      <Button className="mainFont" text="Set timer"/>
    </div>
  );
};

export default Home;
