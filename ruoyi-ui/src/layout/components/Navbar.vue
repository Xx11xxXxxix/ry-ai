<template>
  <div class="navbar">
    <!-- 汉堡按钮（折叠侧边栏） -->
    <hamburger
      id="hamburger-container"
      :is-active="sidebar.opened"
      class="hamburger-container"
      @toggleClick="toggleSideBar"
    />

    <!-- 面包屑导航 -->
    <breadcrumb
      v-if="!topNav"
      id="breadcrumb-container"
      class="breadcrumb-container"
    />

    <!-- 顶部导航（如果有） -->
    <top-nav
      v-if="topNav"
      id="topmenu-container"
      class="topmenu-container"
    />

    <!-- 右侧功能区 -->
    <div class="right-menu">



     <!--
       <template v-if="device!=='mobile'">
              <search id="header-search" class="right-menu-item" />
              <screenfull id="screenfull" class="right-menu-item hover-effect" />
              <el-tooltip content="布局大小" effect="dark" placement="bottom">
                <size-select id="size-select" class="right-menu-item hover-effect" />
              </el-tooltip>
            </template>
      -->


      <!-- 用户头像下拉 -->
      <el-dropdown
        class="avatar-container right-menu-item hover-effect"
        trigger="click"
      >
        <div class="avatar-wrapper">
          <img :src="avatar" class="user-avatar">
          <span class="user-nickname">{{ nickName }}</span>
          <i class="el-icon-caret-bottom" />
        </div>

        <el-dropdown-menu slot="dropdown" class="dark-dropdown">
          <router-link to="/user/profile">
            <el-dropdown-item>个人中心</el-dropdown-item>
          </router-link>
          <el-dropdown-item @click.native="setLayout" v-if="setting">
            <span>布局设置</span>
          </el-dropdown-item>
          <el-dropdown-item divided @click.native="logout">
            <span>退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import TopNav from '@/components/TopNav'
import Hamburger from '@/components/Hamburger'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import Search from '@/components/HeaderSearch'

export default {
  // Logic 部分保持原样，无需改动
  emits: ['setLayout'],
  components: {
    Breadcrumb,
    TopNav,
    Hamburger,
    Screenfull,
    SizeSelect,
    Search
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device',
      'nickName'
    ]),
    setting: {
      get() {
        return this.$store.state.settings.showSettings
      }
    },
    topNav: {
      get() {
        return this.$store.state.settings.topNav
      }
    }
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    setLayout(event) {
      this.$emit('setLayout')
    },
    logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/index'
        })
      }).catch(() => {})
    }
  }
}
</script>

<style lang="scss" scoped>
// 引入你的变量文件，确保能用 $base-sidebar-width 等
@import "~@/assets/styles/variables.scss";

// 定义局部变量
$navbar-bg: #050608;       // 与侧边栏一致的深黑
$navbar-text: #a0aec0;     // 高级灰文字
$navbar-hover: rgba(255, 255, 255, 0.08); // 悬停高亮
$navbar-border: rgba(255, 255, 255, 0.05); // 极细边框

.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: $navbar-bg;
  // 去掉原本廉价的 box-shadow，改用极细的底部边框，更有质感
  box-shadow: none;
  border-bottom: 1px solid $navbar-border;

  // 1. 汉堡按钮（折叠图标）美化
  .hamburger-container {
    line-height: 50px; // 对齐高度
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color: transparent;
    fill: $navbar-text; // SVG 图标颜色

    &:hover {
      background: $navbar-hover;
    }

    // 强制修改内部 svg 颜色
    ::v-deep svg {
      fill: $navbar-text !important;
    }
  }

  // 2. 面包屑导航样式覆盖 (重要：因为它是深色背景，字必须变白)
  .breadcrumb-container {
    float: left;
    ::v-deep .el-breadcrumb__inner {
      color: #64748b; // 普通路径颜色（深灰）
      font-weight: normal;

      &.is-link:hover {
        color: #fff; // 悬停白色
      }
    }
    ::v-deep .el-breadcrumb__item:last-child .el-breadcrumb__inner {
      color: #e2e8f0; // 当前路径颜色（亮白）
      font-weight: 500;
    }
  }

  // 3. 顶部导航容器
  .topmenu-container {
    position: absolute;
    left: 50px;
  }

  // 4. 右侧功能区
  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;
    display: flex;
    align-items: center;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 12px; //稍微增加间距
      height: 100%;
      font-size: 16px; // 图标大小调整
      color: $navbar-text;
      vertical-align: text-bottom;
      transition: all 0.3s;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: $navbar-hover;
          color: #fff; // 悬停时图标变白
        }
      }
    }

    // 用户头像区域
    .avatar-container {
      margin-right: 15px;

      .avatar-wrapper {
        display: flex;
        align-items: center;
        height: 50px;
        position: relative;
        cursor: pointer;

        .user-avatar {
          width: 28px;
          height: 28px;
          border-radius: 6px; // 方圆形比圆形更现代
          margin-right: 8px;
          border: 1px solid rgba(255,255,255,0.1);
        }

        .user-nickname {
          font-size: 14px;
          color: #e2e8f0;
          font-weight: 500;
          margin-right: 4px;
        }

        .el-icon-caret-bottom {
          font-size: 10px;
          color: #64748b;
        }
      }
    }
  }
}
</style>
