<template>
  <el-container class="main-wrapper">
    <main-header
      :height="`70px`"
      @openLoginDialog="onOpenLoginDialog"
      @openRegistDialog="onOpenRegistDialog"
    />
    <el-container class="main-container">
      <el-aside class="hide-on-small" width="240px">
        <main-sidebar :width="`240px`" />
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
    <main-footer :height="`110px`" />
  </el-container>
  <login-dialog
    :open="loginDialogOpen"
    @closeLoginDialog="onCloseLoginDialog"
  />
  <regist-dialog
    :open="registDialogOpen"
    @closeRegistDialog="onCloseRegistDialog"
  />
</template>
<style>
@import "../../../node_modules/element-plus/lib/theme-chalk/index.css";
@import "./main.css";
@import "../../common/css/common.css";
@import "../../common/css/element-plus.css";
</style>
<script>
import RegistDialog from "./components/regist-dialog";
import LoginDialog from "./components/login-dialog";
import MainHeader from "./components/main-header";
import MainSidebar from "./components/main-sidebar";
import MainFooter from "./components/main-footer";

export default {
  name: "Main",
  components: {
    MainHeader,
    MainSidebar,
    MainFooter,
    LoginDialog,
    RegistDialog
  },
  data() {
    return {
      loginDialogOpen: false,
      registDialogOpen: false
    };
  },
  methods: {
    onOpenLoginDialog() {
      this.loginDialogOpen = true;
    },
    onCloseLoginDialog() {
      this.loginDialogOpen = false;
    },
    onOpenRegistDialog() {
      this.registDialogOpen = true;
    },
    onCloseRegistDialog() {
      this.registDialogOpen = false;
    }
  }
};
</script>
