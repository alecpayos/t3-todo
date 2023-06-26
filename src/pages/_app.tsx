import { type AppType } from "next/app";
import { ClerkProvider } from '@clerk/nextjs';

import { api } from "~/utils/api";

import "~/styles/globals.css";
import Layout from "./layout";
import { Header } from "./components/Header";

const MyApp: AppType = ({ Component, pageProps }) => {
  return (
    <ClerkProvider {...pageProps} >
      <Header />
      <Layout>
        <Component {...pageProps} />
      </Layout>
    </ClerkProvider>
  );
};

export default api.withTRPC(MyApp);
