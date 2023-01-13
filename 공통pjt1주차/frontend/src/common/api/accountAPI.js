import $axios from "axios";

/**
 * 로그인 요청을 수행하는 api 호출 함수
 *
 * @param { object } payload 로그인 정보 - { id: stirng, password: string }
 * @returns Promise
 */
const requestLogin = payload => $axios.post("/auth/login", payload);

/**
 * 회원가입 id 중복확인 요청을 수행하는 api 호출 함수
 * @param {string} id 가입할 id
 * @returns Promise
 */
const requestIdCheck = ({ id }) => $axios.get("/users/" + id);

/**
 * 회원가입 요청을 수행하는 api 호출 함수
 * @param {object} registData 회원가입 정보 - {department: string, position: string, name: string, id: string, password:id}
 * @returns Promise
 */
const requestRegist = registData => $axios.post("/users", registData);

/**
 * 회원정보 요청을 수행하는 api 호출 함수
 * @param {object} token accessToken 정보
 * @returns
 */
const requestUserData = token => $axios.get("/users/me", token);

export { requestLogin, requestIdCheck, requestRegist, requestUserData };
