import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import RecipeDetail from "../components/RecipeDetail";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/recipes/:id" element={<RecipeDetail />} />
    </Routes>
  </Router>
);
