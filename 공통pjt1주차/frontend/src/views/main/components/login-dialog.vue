<template>
  <el-dialog
    custom-class="login-dialog"
    title="로그인"
    v-model="state.dialogVisible"
    @close="handleClose"
  >
    <el-form
      :model="state.form"
      :rules="state.rules"
      ref="loginForm"
      :label-position="state.form.align"
    >
      <el-form-item
        prop="id"
        label="아이디"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.id" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item
        prop="password"
        label="비밀번호"
        :label-width="state.formLabelWidth"
      >
        <el-input
          v-model="state.form.password"
          autocomplete="off"
          show-password
        ></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button
          v-loading.fullscreen.lock="state.loadingSpin"
          :disabled="state.btnDisabled"
          type="primary"
          @click="clickLogin"
          >로그인</el-button
        >
      </span>
    </template>
  </el-dialog>
</template>
<style>
.login-dialog {
  width: 400px !important;
  height: 300px;
}
.login-dialog .el-dialog__headerbtn {
  float: right;
}
.login-dialog .el-form-item__content {
  margin-left: 0 !important;
  float: right;
  width: 200px;
  display: inline-block;
}
.login-dialog .el-form-item {
  margin-bottom: 20px;
}
.login-dialog .el-form-item__error {
  font-size: 12px;
  color: red;
}
.login-dialog .el-input__suffix {
  display: none;
}
.login-dialog .el-dialog__footer {
  margin: 0 calc(50% - 80px);
  padding-top: 0;
  display: inline-block;
}
.login-dialog .dialog-footer .el-button {
  width: 120px;
}
</style>
<script>
import { reactive, computed, ref, onMounted } from "vue";
import { useStore } from "vuex";

export default {
  name: "login-dialog",

  props: {
    open: {
      type: Boolean,
      default: false
    }
  },

  setup(props, { emit }) {
    const store = useStore();
    // 마운드 이후 바인딩 될 예정 - 컨텍스트에 노출시켜야함. <return>
    const loginForm = ref(null);
    const loadingSpin = ref(false);

    /*
      // Element UI Validator
      // rules의 객체 키 값과 form의 객체 키 값이 같아야 매칭되어 적용됨
      //
    */

    const idValid = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("필수 입력 항목입니다."));
      } else if (value.length > 16) {
        callback(new Error("최대 16글자까지 입력 가능합니다."));
      } else {
        state.form.idIsValid = true;
        callback();
        return;
      }
      state.form.idIsValid = false;
    };

    const passwordValid = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("필수 입력 항목입니다."));
      } else if (value.length < 9) {
        callback(new Error("최소 9자를 입력해야 합니다."));
      } else if (value.length > 16) {
        callback(new Error("최대 16자까지 입력 가능합니다."));
      } else if (
        !/[0-9]/.test(value) ||
        !/[a-zA-Z]/.test(value) ||
        !/[~!@\#$%<>^&*]/.test(value)
      ) {
        callback(
          new Error("비밀번호는 영문, 숫자, 특수문자가 조합되어야합니다.")
        );
      } else {
        state.form.passwordIsValid = true;
        callback();
        return;
      }
      state.form.passwordIsValid = false;
    };

    const state = reactive({
      form: {
        id: "",
        password: "",
        idIsValid: false,
        passwordIsValid: false,
        align: "left"
      },
      rules: {
        id: [
          {
            required: true,
            validator: idValid,
            trigger: "change"
          }
        ],
        password: [
          { required: true, validator: passwordValid, trigger: "change" }
        ]
      },
      dialogVisible: computed(() => props.open),
      formLabelWidth: "120px",
      btnDisabled: computed(
        () => !(state.form.idIsValid && state.form.passwordIsValid)
      )
    });

    onMounted(() => {
      // console.log(loginForm.value)
    });

    const clickLogin = function() {
      // 로그인 클릭 시 validate 체크 후 그 결과 값에 따라, 로그인 API 호출 또는 경고창 표시
      loginForm.value.validate(async valid => {
        if (valid) {
          loadingSpin.value = true;
          console.log("submit");
          await store.dispatch("accountStore/loginAction", {
            id: state.form.id,
            password: state.form.password
          });
          console.log("accessToken " + store.getters["accountStore/getToken"]);
          handleClose();
          loadingSpin.value = false;
        } else {
          alert("Validate error!");
        }
      });
    };

    const handleClose = function() {
      state.form.id = "";
      state.form.password = "";
      emit("closeLoginDialog");
    };

    return { loginForm, state, clickLogin, handleClose };
  }
};
</script>
