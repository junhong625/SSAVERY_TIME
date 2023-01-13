import {
  requestLogin,
  requestIdCheck,
  requestRegist,
  requestUserData
} from "../common/api/accountAPI";

const state = {
  token: null,
  userData: null,
  isLogin: {
    type: Boolean,
    default: true
  },
  idCheck: {
    type: Boolean,
    default: true
  },
  isRegist: {
    type: Boolean,
    default: false
  }
};

const getters = {
  getToken: state => {
    return state.token;
  },
  getUserData: state => {
    return state.userData;
  },
  getIsLogin: state => {
    return state.isLogin;
  },
  getIdCheck: state => {
    return state.idCheck;
  },
  getIsRegist: state => {
    return state.isRegist;
  }
};

const mutations = {
  setToken: (state, token) => {
    state.token = token;
  },
  setUserData: (state, userData) => {
    state.userData = userData;
  },
  setIsLogin: (state, isLogin) => {
    state.isLogin = isLogin;
  },
  setIdCheck: (state, idCheck) => {
    state.idCheck = idCheck;
  },
  setIsRegist: (state, isRegist) => {
    state.isRegist = isRegist;
  }
};

const actions = {
  loginAction: async ({ commit }, loginData) => {
    const response = await requestLogin(loginData);
    commit("setToken", response.data.accessToken);
    localStorage.setItem("accessToken", response.data.accessToken);
    commit("setIsLogin", false);
  },
  idCheck: async ({ commit }, id) => {
    const response = await requestIdCheck(id);
    console.log(response);
    const status = response.status === 200 ? true : false;
    commit("setIdCheck", status);
  },
  registAction: async ({ commit }, registData) => {
    const response = await requestRegist(registData);
    const status = response.status === 200 ? true : false;
    commit("setIsRegist", status);
  },
  logoutAction: ({ commit }) => {
    localStorage.removeItem("accessToken");
    commit("setToken", null);
    commit("setIsLogin", true);
  },
  getUserData: async ({ commit }, token) => {
    const response = await requestUserData(token);
    commit("setUserData", response.data);
  },
  hasAccessToken: ({ commit }) => {
    const token = localStorage.getItem("accessToken");
    if (token) {
      console.log(token);
      commit("setToken", token);
      commit("setIsLogin", false);
    }
  }
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
};
