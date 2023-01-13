import {
  requestLogin,
  requestIdCheck,
  requestRegist,
  requestUserData
} from "../common/api/accountAPI";

/*
  token : accessToken 정보
  userData : 유저 정보
  isLogin : 로그인 여부
  idCheck: 아이디 중복 여부
  isRegist : 회원가입 성공 여부
*/

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
  // 유저 정보 저장
  setUserData: (state, userData) => {
    state.userData = userData;
  },
  // 로그인 여부 확인
  setIsLogin: (state, isLogin) => {
    state.isLogin = isLogin;
  },
  // 아이디 중복 확인
  setIdCheck: (state, idCheck) => {
    state.idCheck = idCheck;
  },
  // 회원가입 성공 여부 확인
  setIsRegist: (state, isRegist) => {
    state.isRegist = isRegist;
  }
};

const actions = {
  // 로그인, 토큰 저장, 로그인 여부 저장
  loginAction: async ({ commit }, loginData) => {
    const response = await requestLogin(loginData);
    commit("setToken", response.data.accessToken);
    localStorage.setItem("accessToken", response.data.accessToken);
    commit("setIsLogin", false);
  },
  // 아이디 중복 확인
  idCheck: async ({ commit }, id) => {
    const response = await requestIdCheck(id);
    console.log(response);
    const status = response.status === 200 ? true : false;
    commit("setIdCheck", status);
  },
  // 회원가입 수행
  registAction: async ({ commit }, registData) => {
    const response = await requestRegist(registData);
    const status = response.status === 200 ? true : false;
    commit("setIsRegist", status);
  },
  // 로그아웃, 저장된 토큰 삭제
  logoutAction: ({ commit }) => {
    localStorage.removeItem("accessToken");
    commit("setToken", null);
    commit("setIsLogin", true);
  },
  // 유저 정보 저장
  getUserData: async ({ commit }, token) => {
    const response = await requestUserData(token);
    commit("setUserData", response.data);
  },
  // 로컬저장소에 토큰 여부 확인
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
