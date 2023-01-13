<template>
  <el-dialog
    custom-class="regist-dialog"
    title="회원가입"
    v-model="state.dialogVisible"
    @close="handleClose"
  >
    <el-form
      :model="state.form"
      :rules="state.rules"
      ref="registForm"
      :label-position="state.form.align"
    >
      <el-form-item
        prop="department"
        label="소속"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.department" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item
        prop="position"
        label="직책"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.position" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item
        prop="name"
        label="이름"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.name" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item
        prop="id"
        label="아이디"
        :label-width="state.formLabelWidth"
      >
        <el-row :gutter="10">
          <el-col :span="13">
            <el-input v-model="state.form.id" autocomplete="off"></el-input>
          </el-col>
          <el-col :span="10">
            <el-form-item prop="idCheck">
              <el-button
                :disabled="!state.form.idIsValid"
                type="primary"
                @click="clickCheckId"
                >중복 확인</el-button
              >
            </el-form-item>
          </el-col>
        </el-row>
      </el-form-item>
      <el-form-item
        prop="password"
        label="비밀번호"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.password" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item
        prop="passwordConfirm"
        label="비밀번호 확인"
        :label-width="state.formLabelWidth"
      >
        <el-input
          v-model="state.form.passwordConfirm"
          autocomplete="off"
        ></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button
          v-loading.fullscreen.lock="state.loadingSpin"
          @click="clickRegist"
          :disabled="state.btnDisabled"
          type="primary"
          >가입하기</el-button
        >
      </span>
    </template>
  </el-dialog>
</template>
<style>
.regist-dialog {
  width: 400px !important;
  height: 550px;
}
.regist-dialog .el-dialog__headerbtn {
  float: right;
}
.regist-dialog .el-dialog__footer {
  margin: 0 calc(50% - 80px);
  padding-top: 0;
  display: inline-block;
}
.regist-dialog .dialog-footer .el-button {
  width: 120px;
}
</style>
<script>
import { reactive, computed, ref, onMounted } from "vue";
import { useStore } from "vuex";

export default {
  name: "regist-dialog",

  props: {
    open: {
      type: Boolean,
      default: false
    }
  },

  setup(props, { emit }) {
    const store = useStore();
    const registForm = ref(null);
    const registFormItemId = ref(null);

    const loadingSpin = ref(false);

    const clickCheckId = async function() {
      console.log(state.form.id);
      await store.dispatch("accountStore/idCheck", {
        id: state.form.id
      });
      if (store.getters["accountStore/getIdCheck"]) {
        alert("사용 가능한 아이디입니다.");
      } else {
        alert("이미 존재하는 아이디입니다.");
      }
    };

    const handleClose = function() {
      state.form.department = "";
      state.form.position = "";
      state.form.name = "";
      state.form.id = "";
      state.form.password = "";
      state.form.passwordConfirm = "";
      emit("closeRegistDialog");
    };

    const departmentValid = (rule, value, callback) => {
      if (value.length > 30) {
        state.form.departmentIsValid = false;
        callback("최대 30글자까지 입력 가능합니다.");
      } else {
        state.form.departmentIsValid = true;
        callback();
        return;
      }
    };

    const positionValid = (rule, value, callback) => {
      if (value.length > 30) {
        state.form.positionIsValid = false;
        callback("최대 30글자까지 입력 가능합니다.");
      } else {
        state.form.positionIsValid = true;
        callback();
      }
    };

    const nameValid = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("필수 입력 황목입니다."));
      } else if (value.length > 30) {
        callback(new Error("최대 30글자까지 입력 가능합니다."));
      } else {
        state.form.nameIsValid = true;
        callback();
        return;
      }
      state.form.nameIsValid = false;
    };

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

    const passwordConfirmVaild = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("필수 입력 항목입니다."));
      } else if (value.length < 9) {
        callback(new Error("최소 9자를 입력해야 합니다."));
      } else if (value.length > 16) {
        callback(new Error("최대 16자까지 입력 가능합니다."));
      } else if (value !== state.form.password) {
        callback(new Error("입력한 비밀번호와 일치하지 않습니다."));
      } else {
        state.form.passwordConfirmIsValid = true;
        callback();
        return;
      }
      state.form.passwordConfirmIsValid = false;
    };

    const clickRegist = async function() {
      loadingSpin.value = true;
      await store.dispatch("accountStore/registAction", {
        department: state.form.department,
        position: state.form.position,
        name: state.form.name,
        id: state.form.id,
        password: state.form.password
      });
      loadingSpin.value = false;
      if (store.getters["accountStore/getIsRegist"]) {
        handleClose();
        alert("회원 가입이 완료되었습니다.");
      } else {
        alert("회원 가입에 실패하였습니다.");
      }
    };

    const state = reactive({
      form: {
        department: "",
        position: "",
        name: "",
        id: "",
        password: "",
        passwordConfirm: "",
        departmentIsValid: true,
        positionIsValid: true,
        nameIsValid: false,
        idIsValid: false,
        passwordIsValid: false,
        passwordConfirmIsValid: false,
        idIsExcist: true,
        align: "left"
      },
      rules: {
        department: [{ validator: departmentValid, trigger: "change" }],
        position: [{ validator: positionValid, trigger: "change" }],
        name: [
          {
            required: true,
            validator: nameValid,
            trigger: "change"
          }
        ],
        id: [
          {
            required: true,
            validator: idValid,
            trigger: "change"
          }
        ],
        password: [
          { required: true, validator: passwordValid, trigger: "change" }
        ],
        passwordConfirm: [
          { required: true, validator: passwordConfirmVaild, trigger: "change" }
        ]
      },
      dialogVisible: computed(() => props.open),
      btnDisabled: computed(
        () =>
          !(
            state.form.departmentIsValid &&
            state.form.positionIsValid &&
            state.form.nameIsValid &&
            state.form.idIsValid &&
            state.form.passwordIsValid &&
            state.form.passwordConfirmIsValid
          )
      ),
      formLabelWidth: "120px"
    });

    return { registForm, state, clickCheckId, clickRegist, handleClose };
  }
};
</script>
