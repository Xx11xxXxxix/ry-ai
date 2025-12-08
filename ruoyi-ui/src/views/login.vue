<template>
  <div class="login-container">
    <!-- 背景动态粒子或网格装饰 -->
    <div class="bg-grid"></div>
    <div class="bg-glow"></div>

    <div class="login-box animate__animated animate__fadeInUp">
      <!-- 头部：Logo与标题 -->
      <div class="header">
        <!-- 如果你有Logo图片放在这里，没有就只显示文字 -->
        <!-- <img src="@/assets/logo/logo.png" class="logo-img"> -->
        <h1 class="title">计算机通识课程AI测评平台</h1>
        <p class="subtitle">智能 · 循证 · 洞察</p>
      </div>

      <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
        <!-- 用户名 -->
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            placeholder="请输入账号"
            class="premium-input"
            @keyup.enter.native="handleLogin"
          >
            <svg-icon slot="prefix" icon-class="user" class="input-icon" />
          </el-input>
        </el-form-item>

        <!-- 密码 -->
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            placeholder="请输入密码"
            class="premium-input"
            @keyup.enter.native="handleLogin"
          >
            <svg-icon slot="prefix" icon-class="password" class="input-icon" />
          </el-input>
        </el-form-item>

        <!-- 验证码 -->
        <el-form-item prop="code" v-if="captchaEnabled">
          <div class="code-row">
            <el-input
              v-model="loginForm.code"
              placeholder="验证码"
              class="premium-input flex-1"
              @keyup.enter.native="handleLogin"
            >
              <svg-icon slot="prefix" icon-class="validCode" class="input-icon" />
            </el-input>
            <div class="code-img-wrapper">
              <img :src="codeUrl" @click="getCode" class="code-img" />
            </div>
          </div>
        </el-form-item>

        <!-- 记住我 -->
        <div class="remember-row">
          <el-checkbox v-model="loginForm.rememberMe" class="premium-checkbox">
            记住密码
          </el-checkbox>
        </div>

        <!-- 登录按钮 -->
        <el-button
          :loading="loading"
          type="primary"
          class="login-btn"
          @click.native.prevent="handleLogin"
        >
          <span v-if="!loading">登 录</span>
          <span v-else>载入中...</span>
        </el-button>
      </el-form>

      <div class="footer">
        © 2025 AI Evaluation Platform. All Rights Reserved.
      </div>
    </div>
  </div>
</template>

<script>
// 逻辑部分保持不变，直接复制原来的即可
import { getCodeImg } from "@/api/login"
import Cookies from "js-cookie"
import { encrypt, decrypt } from '@/utils/jsencrypt'

export default {
  name: "Login",
  data() {
    return {
      title: process.env.VUE_APP_TITLE,
      codeUrl: "",
      loginForm: {
        username: "",
        password: "",
        rememberMe: false,
        code: "",
        uuid: ""
      },
      loginRules: {
        username: [{ required: true, trigger: "blur", message: "请输入您的账号" }],
        password: [{ required: true, trigger: "blur", message: "请输入您的密码" }],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }]
      },
      loading: false,
      captchaEnabled: true,
      redirect: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  created() {
    this.getCode()
    this.getCookie()
  },
  methods: {
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img
          this.loginForm.uuid = res.uuid
        }
      })
    },
    getCookie() {
      const username = Cookies.get("username")
      const password = Cookies.get("password")
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      }
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 })
            Cookies.set("password", encrypt(this.loginForm.password), { expires: 30 })
            Cookies.set('rememberMe', this.loginForm.rememberMe, { expires: 30 })
          } else {
            Cookies.remove("username")
            Cookies.remove("password")
            Cookies.remove('rememberMe')
          }
          this.$store.dispatch("Login", this.loginForm).then(() => {
            this.$router.push({ path: this.redirect || "/" }).catch(()=>{})
          }).catch(() => {
            this.loading = false
            if (this.captchaEnabled) {
              this.getCode()
            }
          })
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
// --- 核心变量：深邃科技蓝 ---
$bg-color: #0b0f19; // 极深蓝黑背景
$card-bg: rgba(20, 26, 40, 0.7); // 卡片背景
$border-color: rgba(255, 255, 255, 0.08); // 极细边框
$primary-color: #3b82f6; // 专业蓝 (Intel/IBM 风格)
$text-main: #ffffff;
$text-sub: #94a3b8;

.login-container {
  height: 100vh;
  width: 100%;
  background-color: $bg-color;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;

  // 1. 背景：几何网格 (体现秩序)
  .bg-grid {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image:
      linear-gradient($border-color 1px, transparent 1px),
      linear-gradient(90deg, $border-color 1px, transparent 1px);
    background-size: 50px 50px;
    opacity: 0.3;
    pointer-events: none;
  }

  // 2. 背景：深邃光晕 (体现纵深)
  .bg-glow {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 800px;
    height: 800px;
    background: radial-gradient(circle, rgba(59, 130, 246, 0.15) 0%, transparent 70%);
    pointer-events: none;
  }
}

.login-box {
  width: 440px;
  padding: 50px 40px;
  background: $card-bg;
  backdrop-filter: blur(20px); // 磨砂质感
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid $border-color;
  border-radius: 16px;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5); // 沉稳的阴影
  z-index: 10;
  position: relative;

  // 顶部发光线条
  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
  }
}

.header {
  text-align: center;
  margin-bottom: 40px;

  .title {
    font-size: 28px;
    font-weight: 600;
    color: $text-main;
    margin: 0 0 10px 0;
    letter-spacing: 1px;
    font-family: 'PingFang SC', 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Arial, sans-serif;
  }

  .subtitle {
    font-size: 14px;
    color: $text-sub;
    margin: 0;
    letter-spacing: 2px;
    text-transform: uppercase;
  }
}

// --- 输入框样式重写 (Element UI 深度覆盖) ---
.premium-input {
  ::v-deep .el-input__inner {
    background: rgba(0, 0, 0, 0.2); // 深色底
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    height: 48px;
    line-height: 48px;
    color: #fff;
    padding-left: 40px;
    transition: all 0.3s ease;

    &::placeholder {
      color: #5c6b7f;
    }

    &:hover {
      border-color: rgba(255, 255, 255, 0.2);
    }

    &:focus {
      border-color: $primary-color; // 聚焦时显示专业蓝
      background: rgba(0, 0, 0, 0.3);
      box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2); // 微弱的光晕
    }
  }

  // 图标颜色
  .input-icon {
    font-size: 16px;
    color: #5c6b7f;
    margin-left: 5px;
    transition: color 0.3s;
  }

  ::v-deep .el-input__inner:focus ~ .el-input__prefix .input-icon {
    color: $primary-color;
  }
}

.code-row {
  display: flex;
  align-items: center;
  gap: 15px;

  .flex-1 { flex: 1; }

  .code-img-wrapper {
    height: 48px;
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.1);
    cursor: pointer;
    transition: border-color 0.3s;

    &:hover {
      border-color: $primary-color;
    }

    .code-img {
      height: 100%;
      width: 110px;
      display: block;
    }
  }
}

.remember-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.premium-checkbox {
  ::v-deep .el-checkbox__label {
    color: $text-sub;
  }
  ::v-deep .el-checkbox__inner {
    background-color: transparent;
    border-color: #5c6b7f;
  }
  ::v-deep .el-checkbox__input.is-checked .el-checkbox__inner {
    background-color: $primary-color;
    border-color: $primary-color;
  }
  ::v-deep .el-checkbox__input.is-checked + .el-checkbox__label {
    color: $text-main;
  }
}

.login-btn {
  width: 100%;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  border-radius: 8px;
  background: linear-gradient(135deg, $primary-color, darken($primary-color, 10%)); // 稳重的蓝色渐变
  border: none;
  letter-spacing: 2px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);

  &:hover {
    transform: translateY(-1px);
    box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
    background: linear-gradient(135deg, lighten($primary-color, 5%), $primary-color);
  }

  &:active {
    transform: translateY(0);
  }
}

.footer {
  margin-top: 30px;
  text-align: center;
  font-size: 12px;
  color: rgba(255, 255, 255, 0.2);
  font-family: Arial, sans-serif;
}

/* 简单的淡入动画 */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translate3d(0, 20px, 0);
  }
  to {
    opacity: 1;
    transform: translate3d(0, 0, 0);
  }
}
.animate__fadeInUp {
  animation-name: fadeInUp;
  animation-duration: 0.8s;
  animation-fill-mode: both;
}
</style>
