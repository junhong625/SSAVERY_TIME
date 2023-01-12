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
        prop="team"
        label="소속"
        :label-width="state.formLabelWidth"
      >
        <el-input v-model="state.form.team" autocomplete="off"></el-input>
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
            <el-button type="primary">중복 확인</el-button>
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
        <el-button type="primary">가입하기</el-button>
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

    const clickCheckId = function() {
      registFormItemId.value.validate(async valid => {});
    };

    const handleClose = function() {
      state.form.team = "";
      state.form.position = "";
      state.form.name = "";
      state.form.id = "";
      state.form.password = "";
      state.form.passwordConfirm = "";
      emit("closeRegistDialog");
    };

    const maxInputLength = (rule, value, callback) => {
      if (value.length > 30) {
        callback("최대 30글자까지 입력 가능합니다.");
      } else {
        callback();
      }
    };

    const passwordValid = (rule, value, callback) => {
      if (value.length < 9) {
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
        callback();
      }
    };

    const passwordConfirmVaild = (rule, value, callback) => {
      if (value.length < 9) {
        callback(new Error("최소 9자를 입력해야 합니다."));
      } else if (value.length > 16) {
        callback(new Error("최대 16자까지 입력 가능합니다."));
      } else if (value !== state.form.password) {
        callback(new Error("입력한 비밀번호와 일치하지 않습니다."));
      } else {
        callback();
      }
    };

    const state = reactive({
      form: {
        team: "",
        position: "",
        name: "",
        id: "",
        password: "",
        passwordConfirm: "",
        align: "left"
      },
      rules: {
        team: [{ validator: maxInputLength, trigger: "change" }],
        position: [{ validator: maxInputLength, trigger: "change" }],
        name: [
          {
            required: true,
            message: "필수 입력 항목입니다.",
            trigger: "change"
          },
          { validator: maxInputLength, trigger: "change" }
        ],
        id: [
          {
            required: true,
            message: "필수 입력 항목입니다.",
            trigger: "change"
          },
          {
            max: 16,
            message: "최대 16글자까지 입력 가능합니다.",
            trigger: "change"
          }
        ],
        password: [
          {
            required: true,
            message: "필수 입력 항목입니다.",
            trigger: "change"
          },
          { validator: passwordValid, trigger: "change" }
        ],
        passwordConfirm: [
          {
            required: true,
            message: "필수 입력 항목입니다.",
            trigger: "change"
          },
          { validator: passwordConfirmVaild, trigger: "change" }
        ]
      },
      dialogVisible: computed(() => props.open),
      formLabelWidth: "120px"
    });

    return { registForm, state, handleClose };
  }
};
</script>
